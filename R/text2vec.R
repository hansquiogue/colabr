#' Plot LDA models from text2vec in Google Colab
#'
#' Allows LDA models from the text2vec package to be plotted
#' in Google Colab. A domain is generated to view either as
#' embedded or as a standalone link. Uses localtunnel to
#' publicly share localhost. More information can be
#' found here: https://localtunnel.me
#'
#' @param lda_model A LDA model object from text2vec.
#'
#' - LDA creation example can be found here:
#'  http://text2vec.org/topic_modeling.html#example6
#'
#' - Parameters can be viewed in documentation on page 22 here:
#'  https://cran.rapporter.net/web/packages/text2vec/text2vec.pdf
#' @param embedded A boolean value on whether or not an embedded
#' HTML page is displayed. By default, it is TRUE or an embedded
#' page is outputed. Otherwise, a link is generated.
#' @param port A port number to host tunneled server.
#' Default value is 4321.
#' @export
plot_lda_text2vec <- function(lda_model, embedded = TRUE, port = 4321) {

  # Error handling
  if (!is.logical(embedded)) stop('embedded must be TRUE or FALSE')
  if (!is.numeric(port)) stop('port must be numeric')

  # Checks if lda_model is correct
  # Attributes required in LDA model
  attributes <- c('WarpLDA', 'LDA', 'TopicModel',
                  'mlapiDecomposition', 'mlapiTransformation',
                  'mlapiBase', 'R6')

  # Loops through each attribute in lda_model
  for (attr in class(lda_model)) {
    # If attribute not found, LDA model is incorrect
    if (!(attr %in% attributes)) {
      stop('lda_model needs to be a fitted LDA model from text2vec.')
    }
  }

  # Checks if localtunnel is installed
  installed <- system('npm list - g | grep localtunnel')

  # Exit status of 1 (localtunnel not installed)
  if (installed == 1) {
    # Download localtunnel
    system('npm install -g localtunnel')
  }

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
