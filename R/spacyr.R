#' Setup spacyr to work in Google Colab
#'
#' Setups and initalizes the spacyr package to work in Google Colab.
#' Please ensure you have installed Anaconda using setup_anaconda
#' first and have installed the spacyr package.
#'
#' @param env A string name for the conda environment.
#' Default is called 'r-reticulate'.
#' @param lang_models The language package for loading spaCy.
#' Default is 'en_core_web_sm' (English). For more models
#' and languages, go to spacy.io/usage/models.
#' @export
setup_spacyr <- function(env = 'r-reticulate', lang_models = 'en_core_web_sm') {

  # Check if Anaconda setup
  if (reticulate::py_config()$forced != 'RETICULATE_PYTHON') {
    stop('Anaconda not setup. Setup with setup_anaconda().')
  }

  # Handles environment
  if (!is.character(env)) stop('env must be a string')

  # Boolean on whether or not library was installed
  lib_installed <- library(spacyr, logical.return = TRUE)

  # Spacyr library is installed
  if (lib_installed) {
    # Checks if running on colab enviroment
    colabr::check_colab()

    # Installing spacy and setting environment to conda environment
    spacy_install(envname = env, lang_models = lang_models, prompt = FALSE, pip = TRUE)

    # Initializing spacy with conda environment
    path <- paste('/usr/local/envs/', env, '/bin/python', sep = '')
    spacy_initialize(condaenv = env, model = lang_models, python_executable = path)

    # Message indicating success
    message('Spacy installed and initialized.')
    message(paste(lang_models, 'model downloaded. Use spacy_download_langmodel()',
                'to download different language models.'))

  # Library not installed
  } else {
    stop('Please install spacyr package prior to using this function.')
  }
}
