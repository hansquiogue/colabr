#' Setup cleanNLP to work in Google Colab
#'
#' Setups and initalizes the cleanNLP package to work in Google Colab.
#' Please ensure you have installed Anaconda using setup_anaconda
#' first and have installed the spacyr package.
#'
#' @param env A string name for the conda environment.
#' Default value is 'r-reticulate'.
#' @export
setup_cleanNLP <- function(env = 'r-reticulate') {

    # Checks if running on colab enviroment
    colabr::check_colab()
    # Checks environment is a string
    if (!is.character(env)) stop('env must be a string')

    # Setup spacyr and install spacy
    colabr::setup_spacyr(env)

    # Installs cleanNLP and stanfordnlp
    system('pip install cleannlp')
    system('pip install stanfordnlp')

    # Success message
    message('Success! Models and Python backends should produce no errors now.')
}
