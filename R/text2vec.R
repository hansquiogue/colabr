#' Plot LDA models from text2vec in Google Colab
#'
#' Generates a link to use for text2vec LDA plots in Google Colab
#' @export
generate_lda_plot_link <- function() {

  # TODO: Error checking
  # TODO: Port as argument

  # Download localtunnel
  system('npm install -g localtunnel')

  # Generate random domain
  base <- "lda-model-plot"
  number <- sample.int(100000000, 1)
  domain <- paste(base, as.character(number), sep = '')

  # Kill all services
  system('killall lt')

  # Run localtunnel
  system(paste('lt --port 4321 --subdomain ', domain, sep = ''))

  # Message that domain is generated
  print(paste('View plot at domain: http://', domain, '.loca.lt', sep = ''))
}
