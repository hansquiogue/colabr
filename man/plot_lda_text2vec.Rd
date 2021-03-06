% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/text2vec.R
\name{plot_lda_text2vec}
\alias{plot_lda_text2vec}
\title{Plot LDA models from text2vec in Google Colab}
\usage{
plot_lda_text2vec(lda_model, embedded = TRUE, port = 4321)
}
\arguments{
\item{lda_model}{A LDA model object from text2vec.

- LDA creation example can be found here:
 http://text2vec.org/topic_modeling.html#example6

- Parameters can be viewed in documentation on page 22 here:
 https://cran.rapporter.net/web/packages/text2vec/text2vec.pdf}

\item{embedded}{A boolean value on whether or not an embedded
HTML page is displayed. By default, it is TRUE or an embedded
page is outputed. Otherwise, a link is generated.}

\item{port}{A port number to host tunneled server.
Default value is 4321.}
}
\description{
Allows LDA models from the text2vec package to be plotted
in Google Colab. A domain is generated to view either as
embedded or as a standalone link. Uses localtunnel to
publicly share localhost. More information can be
found here: https://localtunnel.me
}
