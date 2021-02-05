#' Checks if runtime is running on Google Colab
#'
#' @export
check_colab <- function() {
  # Import python sys module
  sys <- reticulate::import('sys')
  # Stops if google module does not exist
  if (!exists('google', where = sys$modules)) stop('colabr only works on Google Colab.')
}
