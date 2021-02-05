#' Generate Google Colab alerts
#'
#' Display a link or an embedded webpage that helps generate Colab alerts.
#' For more details, view this tutorial notebook: coming soon!
#'
#' @param width A numeric value of the width to display the embedded webpage.
#' @param height A numeric value of the height to display the embedded webpage.
#' @param embedded A boolean value on whether or not to display an embedded version
#' of the alert webpage. If set to false, a link to the webpage is printed instead.
#' @export
generate_alerts <- function(width = 1000, height = 500, embedded = TRUE) {

  # Checks if running on colab enviroment
  colabr::check_colab()

  # Error handling for arguments
  if (!is.numeric(width) | !is.numeric(height)) stop('width or height arguments need to be numeric.')
  if (width < 1 | height < 1) stop('width or height cannot be 0 or negative.')
  if (!is.logical(embedded)) stop('embedded needs to be TRUE or FALSE')

  # String of HTML code to display embedded webpage
  html_str <- paste('<iframe src="https://quiogue.me/google-colab-alerts" width=',
                    as.character(width), " height=", as.character(height),
                    '></iframe>', sep = "")

  # Display embedded webpage
  if (embedded) {
    IRdisplay::display_html(html_str)

  # Print webpage link
  } else {
    message('Generate alerts at: https://quiogue.me/google-colab-alerts')
  }
}
