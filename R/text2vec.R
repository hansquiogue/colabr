#' Plot LDA models from text2vec in Google Colab
#'
#' Allows LDA models from the text2vec package to be plotted
#' in Google Colab. A domain is generated to view either as
#' embedded or as a standalone link.
#'
#' @param lda_model A lda model object from text2vec.
#' @param embedded A boolean value on whether or not an embedded
#' HTML page is displayed. Otherwise, a link is generated.
#' @param port A port number to host tunneled server.
#' Default value is 4321.
#' @export
plot_lda_text2vec <- function(lda_model, embedded = TRUE, port = 4321) {

  # TODO: Error checking
  # TODO: Port as argument
  # TODO: Seperate installation for npm installation

  # Download localtunnel
  system('npm install -g localtunnel')

  # Generate random domain
  base <- "lda-model-plot"
  number <- sample.int(100000000, 1)
  domain <- paste(base, as.character(number), sep = '')

  # Kill all services
  system('killall lt')

  # Run localtunnel
  system(paste('lt --port ', as.character(port),' --subdomain ', domain, ' &', sep = ''))

  # Embedding is shown
  if (embedded) {
    IRdisplay::display_html(paste('<iframe src="//', domain, '.loca.lt"',
                                  ' width=1000 height=800></iframe>', sep = ''))

  # Embedding is not shown
  } else {
    # Message that domain is generated
    print(paste('View plot at domain: http://', domain, '.loca.lt', sep = ''))
  }

  # Other informative messages
  print('Do not stop running this code until you are done with the visuals.')
  print('Ignore local domain that is generated below.')

  # Starting server
  lda_model$plot(open.browser = TRUE)
}
