# colabr

## *Improving or Fixing Functionality with R Notebooks in Google Colaboratory*

colabr is a simple R package aimed at fixing other R package issues and 
help create better notebooks in Google Colaboratory. 

At the moment, `spacyr`, `cleanNLP` and `text2vec` are the only packages implemented with colabr that are working in Google Colab notebooks. You may request other package fixes at (this email).

# Installation

To install colabr, you must have created a new or are using an existing R notebook in Google Colab. 

An easy way to create one is [following this link.](https://colab.to/r), assuming that you have logged in with your Google account already. The notebook will be stored under 'Colab Notebooks' in the root directory of your Google Drive. You may move this notebook anywhere in your Google Drive if you prefer.

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

Note: the following documentation is still under construction...

# Fixes

## spacyr

..

## cleanNLP

..

## text2vec

..

## Anaconda

..

# Quality of Life

## Alerts

..

## Downloading Files

..