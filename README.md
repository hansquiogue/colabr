# colabr

## *Improving or Fixing Functionality with R Notebooks in Google Colaboratory*

colabr is a simple R package aimed at fixing other R package issues and help create better notebooks in Google Colaboratory. For more documentation and example usage of this package, you may reference and use this [Colab notebook.](https://colab.research.google.com/drive/1b5m_w04w1SpwIHLIyyD631_593hy_JLE?usp=sharing)

At the moment, `spacyr`, `cleanNLP` and `text2vec` are the only packages implemented with colabr that are working in Google Colab notebooks. 

You may request other package fixes and other issues at colabr.package@gmail.com

# Installation

To install colabr, you must have created a new or are using an existing R notebook in Google Colab. 

An easy way to create one is [following this link](https://colab.to/r), assuming that you have logged in with your Google account already. The notebook will be stored under 'Colab Notebooks' in the root directory of your Google Drive. You may move this notebook anywhere in your Google Drive if you prefer.

Once inside a R notebook in Google Colab, you need to have `devtools` installed. You may run the code below inside a code chunk inside the notebook:

```
install.packages('devtools')
```

Once that's done, you can install colabr with the following code:

```
devtools::install_github('hansquiogue/colabr')
```

After the package is finished downloading you can load the library like so:

```
library(colabr)
```

That's it! You are now able to use the colabr package.

Note that you will need to repeat the installation process everytime you start a new Colab runtime. 

# Fixes

## spacyr

Initalizing spacyr will not work properly in Google Colab. This package will simplify and fix the initialization process. For a full guide, please visit this [notebook](https://colab.research.google.com/drive/1b5m_w04w1SpwIHLIyyD631_593hy_JLE#scrollTo=6AsIwJ9McwQj).

## cleanNLP

Like spacyr, cleanNLP will not initialize properly in Colab. The process is nearly identical to spacyr and be viewed in this [notebook](https://colab.research.google.com/drive/1b5m_w04w1SpwIHLIyyD631_593hy_JLE#scrollTo=6AsIwJ9McwQj).

## text2vec

Interactive LDA plots from text2vec do not work in Google Colab. To fix this, [localtunnel](https://localtunnel.me) is used to create a publicly hosted local server for the visualization. For the full guide, here's the [notebook](https://colab.research.google.com/drive/1b5m_w04w1SpwIHLIyyD631_593hy_JLE#scrollTo=5u9iQ-OyaLCA).

# Quality of Life

## Alerts

With this package, you are able to create alert messages to make your text stand out more. Here's the [notebook](https://colab.research.google.com/drive/1b5m_w04w1SpwIHLIyyD631_593hy_JLE#scrollTo=s-iU-qg7cPV9) of the full alert guide.

## Downloading Files

Downloading files in R notebooks in Colab can be bit tricky. Colabr simplifies the process with minimal setup and code. For the full guide, here's the [notebook.](https://colab.research.google.com/drive/1b5m_w04w1SpwIHLIyyD631_593hy_JLE#scrollTo=QrEM9nfNIqIr)