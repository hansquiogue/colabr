#' Setup an Anaconda environment
#'
#' Setup an Anaconda environment to work in Google Colab
#'
#' @param env A string name for the conda environment.
#' Default value is 'r-reticulate'.
#' @export
setup_anaconda <- function(env = 'r-reticulate') {
  # TODO: Error checking

  # Forces conda environment based on user input
  reticulate::use_condaenv(env, required = TRUE)

  # Sets reticulate environment to correct path
  path <- paste('/usr/local/envs/', env, '/bin/python', sep = '')
  Sys.setenv(RETICULATE_PYTHON = path)

  # Success message
  print(paste('Conda environment set to:', env))
}
