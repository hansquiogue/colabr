#' Downloads a file or files in folder in Google Drive into Google Colab
#'
#' Downloads one or more files from a Google Drive repository into Google Colab,
#' assuming that the files or folder they are stored in are publicly
#' available. Note: when downloading files from a Drive folder,
#' ensure that there are no sub-folders stored in the folder
#' itself; there can only be files inside.
#'
#' @param drive_link A string of the Drive file or folder link.
#' Make sure that the file or folder is public.
#' @export
download_drive <- function(drive_link) {

  # Error checking
  # Ensures drive link is a string
  if (!is.character(drive_link) | length(drive_link) != 1) {
    stop('drive_link must be a string.')
  }

  # Splits up link
  link_split <- strsplit(drive_link, '/')

  # Ensures link is correct format
  if (link_split[[1]][1] != 'drive.google.com' & link_split[[1]][3] != 'drive.google.com') {
    stop('drive_link is not a proper Google Drive link.')
  }

  # Link is file
  if ("file" %in% link_split[[1]]) {
    message("File link detected.")

    # Retrieve ID
    id <- link_split[[1]][length(link_split[[1]]) - 1]

    # Downloads file
    system(paste('gdown --id', id))
    message('File downloaded.')

  # Link is folder
  } else if ("folders" %in% link_split[[1]]) {
    message('Folder link detected.')
    message(paste('Please ensure the folder does not contain',
            'any sub-folders inside. Otherwise, an error might occur.'))

    # Load libraries
    suppressMessages(library(tidyverse))
    suppressMessages(library(googledrive))
    suppressMessages(library(reticulate))

    # Loads other dependencies if needed
    if (file.exists("/usr/local/lib/python3.6/dist-packages/google/colab/_ipython.py")) {
      surpressMessages(library("R.utils"))
      surpressMessages(library("httr"))
      my_check <- function() { return(TRUE) }
      reassignInPackage("is_interactive", pkgName = "httr", my_check)
      options(rlang_interactive = TRUE)
    }

    # Mount drive
    message(paste('Autentication needed. Please click the link below',
                  'and authorize tidyverse for Google Drive access.'))
    drive_auth(use_oob = TRUE, cache = TRUE)

    # Identify folder on Drive
    folder <- drive_get(as_id(drive_link))

    # Files in folder
    files <- drive_ls(folder)

    # Download files
    walk(files$id, ~ drive_download(as_id(.x), overwrite = TRUE))

  # Not a proper link
  } else {
    stop('drive_link is not a proper Google Drive link')
  }
}

