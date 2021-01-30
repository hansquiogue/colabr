#' Generate Google Colab alerts
#'
#' Display a link or an embedded webpage that helps generate Colab alerts.
#'
#' @param embeded A boolean value on whether or not to display an embedded version
#' of the alert webpage. If set to false, a link to the webpage is printed instead.
#' @param width A numeric value of the width to display the embedded webpage.
#' @param height A numeric value of the height to display the embedded webpage.
#' @export
generate_alerts <- function(embedded = TRUE, width = 800, height = 500) {

  # String of HTML code to display embedded webpage
  html_str <- paste('<iframe src="quiogue.me/google-colab-alerts" width=',
                    as.character(width), " height=", as.character(height),
                    '></iframe>', sep = "")

  # Display embedded webpage
  if (embedded) {
    IRdisplay::display_html(cat(html_str))

  # Print webpage link
  } else {
    print('Generate alerts at: https://quiogue.me/google-colab-alerts')
  }
}
