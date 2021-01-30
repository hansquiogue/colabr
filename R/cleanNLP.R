#' Setup cleanNLP to work in Google Colab
#'
#' Setups and initalizes the cleanNLP package to work in Google Colab.
#' Please ensure you have installed Anaconda using setup_anaconda
#' first and have installed the spacyr package.
#'
#' @param env A string name for the conda environment
#' @export
setup_cleanNLP <- function(env = 'r-reticulate') {

    # Setup spacyr and install spacy
    colabr::setup_spacyr(env)

    # Installs cleanNLP
    system('pip install cleannlp')

    # Success message
    print('Success! Models and Python backends should produce no errors now.')
}
