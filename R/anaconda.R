#' Download and install Anaconda in Google Colab
#'
#' Downloads and installs Anaconda. Stops runtime to restart it.
#' This function only needs to be run once for every Colab
#' runtime session.
#' @export
download_anaconda <- function() {

  # Checks if Anaconda is installed
  if (colabr::check_anaconda() == 0) stop('Anaconda is already installed.')

  # Checks if running on colab enviroment
  colabr::check_colab()

  # TODO: Re-comment, progress bars?
  system("wget https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh")
  system("chmod +x Anaconda3-2020.02-Linux-x86_64.sh")
  system("bash ./Anaconda3-2020.02-Linux-x86_64.sh -b -f -p /usr/local")
  reticulate::py_run_string("import sys; sys.path.append('/usr/local/lib/python3.6/site-packages/')")
  system("conda update -n base -c defaults conda -y")
  system("conda config --add channels bioconda")
  system("conda config --add channels conda-forge")

  message('Stopping runtime! Do not worry about the crash error, it is on purpose.')
  message('Restarting notebook...')
  reticulate::py_run_string('import os; os.kill(os.getpid(), 9)')
}

#' Setup an Anaconda environment
#'
#' Setup an Anaconda environment to work in Google Colab.
#' @param env A string name for the conda environment.
#' Default value is 'r-reticulate'.
setup_anaconda <- function(env = 'r-reticulate') {

  # Checks if Anaconda is installed
  if (colabr::check_anaconda() != 0) {
    stop('Anaconda is not installed. Download and install with download_anaconda().')
  }

  # Checks env
  if (!is.character(env)) stop('env must be a string.')
  # Checks for colab runtime
  colabr::check_colab()

  # Forces conda environment based on user input
  reticulate::use_condaenv(env, required = TRUE)

  # Sets reticulate environment to correct path
  path <- paste('/usr/local/envs/', env, '/bin/python', sep = '')
  Sys.setenv(RETICULATE_PYTHON = path)

  # Success message
  message(paste('Conda environment set to:', env))
}

#' Checks if Anaconda is installed or not
#'
#' @return Exit code of checking conda version
#' @export
check_anaconda <- function() {
  # Exit code of Anaconda version
  return(suppressWarnings(system('command -v conda')))
}
