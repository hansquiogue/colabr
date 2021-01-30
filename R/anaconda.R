#' Setup an Anaconda environment
#'
#' Setup an Anaconda environment to work in Google Colab. Downloads and
#' installs Anaconda and creates a new environment based on user
#' input.
#'
#' @param env A string name for the conda environment.
#' Default value is 'r-reticulate'.
#' @export
setup_anaconda <- function(env = 'r-reticulate') {
  # TODO: Error checking

  # TODO: Re-comment, progress bars?
  system("wget https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh")
  system("chmod +x Anaconda3-2020.02-Linux-x86_64.sh")
  system("bash ./Anaconda3-2020.02-Linux-x86_64.sh -b -f -p /usr/local")
  reticulate::py_run_string("import sys; sys.path.append('/usr/local/lib/python3.6/site-packages/')")
  system("conda update -n base -c defaults conda -y")
  system("conda config --add channels bioconda")
  system("conda config --add channels conda-forge")

  # Forces conda environment based on user input
  reticulate::use_condaenv(env, required = TRUE)

  # Sets reticulate environment to correct path
  path <- paste('/usr/local/envs/', env, '/bin/python', sep = '')
  Sys.setenv(RETICULATE_PYTHON = path)

  # Success message
  print(paste('Conda environment set to:', env))
}
