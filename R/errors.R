#' Checks if runtime is running on Google Colab
#'
#' @export
check_colab <- function() {
  # Import os module
  os <- reticulate::import('os')
  # Tries for Colab environment
  colab <- try(os$environ['COLAB_GPU'], silent = TRUE)
  # Non-colab environments will be 'try-error'
  if (class(colab) == "try-error") stop('Must be in Colab runtime.')
}
