#' Setup spacyr to work in Google Colab
#'
#' Setups and initalizes the spacyr package to work in Google Colab.
#' Please ensure you have installed Anaconda using setup_anaconda
#' first and have installed the spacyr package.
#'
#' @param env A string name for the conda environment
#' @export
setup_spacyr <- function(env = 'r-reticulate') {

  # Boolean on whether or not library was installed
  lib_installed <- library(spacyr, logical.return = TRUE)

  # Spacyr library is installed
  if (lib_installed) {
    # TODO: Check if Anaconda installed?

    # Installing spacy and setting environment to conda environment
    spacy_install(envname = env, prompt = FALSE, pip = TRUE)

    # Initializing spacy with conda environment
    spacy_initialize(condaenv = env)

    # Message indicating success
    print('Spacy installed and initialized. "en" language model downloaded')

  # Library not installed
  } else {
    print('Please install spacyr package prior to using this function.')
  }
}
