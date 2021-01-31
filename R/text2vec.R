#' Plot LDA models from text2vec in Google Colab
#'
#' @param lda_model A lda model object from text2vec.
#' @export
plot_lda_text2vec <- function(lda_model) {

  # TODO: Error checking

  # Download localtunnel
  system('npm install -g localtunnel')

  # Generate random domain
  base <- "lda-model-plot"
  number <- sample.int(100000000, 1)
  domain <- paste(base, as.character(number), sep = '')

  # Message that domain is generated
  print(paste('View plot at domain:', domain))
  print('Do not stop running this code until you are done with the visuals.')
  print('Ignore local domain that is generated below.')

  # Starting server
  lda_model$plot(open.browser = TRUE)
}
