#' Setup Anaconda to work in Google Colab
#'
#' Downloads and installs Anaconda in Google Colab. Also
#' uses a user specified environment variable.
#'
#' @param env A string name for the conda environment.
#' @export
setup_anaconda <- function(env = 'r-reticulate') {
  # TODO: Error checking

  # Downloading and installing Anaconda
  print('Currently downloading Anaconda. Note: entire process will take a while.')
  system('wget https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh')
  system('chmod +x Anaconda3-2020.02-Linux-x86_64.sh')
  system('bash ./Anaconda3-2020.02-Linux-x86_64.sh -b -f -p /usr/local')

  # Append paths
  print('Anaconda installed. Appending libraries to correct Google Colab directory...')
  reticulate::py_run_string('import sys; sys.path.append("/usr/local/lib/python3.6/site-packages/")')

  # Updating Anaconda
  print('Updating Anaconda to latest version..')
  system('conda update -n base -c defaults conda -y')
  system('conda config --add channels bioconda')
  system('conda config --add channels conda-forge')

  # Create new environmnent based on input
  system(paste('conda create -n', env))

  # Activate conda environment
  reticulate::use_condaenv(env)

  # Message indicating Anaconda has been setup
  print(paste('Anaconda setup with environment:', env))
}
