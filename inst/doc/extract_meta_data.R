## ----setup, eval=FALSE---------------------------------------------------
#  # load required packages
#  library(mediacloudr)
#  library(httr)
#  library(xml2)
#  library(rvest)

## ----get_article, eval=FALSE---------------------------------------------
#  # define media id as integer
#  story_id <- 1126843780L
#  # download article
#  article <- get_story(story_id = story_id)

## ----download_website, eval=FALSE----------------------------------------
#  # download article
#  response <- GET(article$url[1])
#  # extract article html
#  html_document <- content(response, type = "text", encoding = "UTF-8")
#  # parse website
#  parsed_html <- read_html(html_document)

## ----body_content, eval=FALSE--------------------------------------------
#  # extract article body
#  article_body_nodes <- html_nodes(x = parsed_html, css = ".content-well div p")
#  article_body <- html_text(x = article_body_nodes)
#  # paste character vector to one text
#  article_body <- paste(article_body, collapse = " ")

## ----get_meta_data, eval=FALSE-------------------------------------------
#  # extract meta data from html document
#  meta_data <- extract_meta_data(html_doc = html_document)

