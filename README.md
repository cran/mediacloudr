
<!-- README.md is generated from README.Rmd. Please edit that file -->

# mediacloudr

<!-- badges: start -->

[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Build
Status](https://travis-ci.org/jandix/mediacloudr.svg?branch=master)](https://travis-ci.org/jandix/mediacloudr)
[![Codecov test
coverage](https://codecov.io/gh/jandix/mediacloudr/branch/master/graph/badge.svg)](https://codecov.io/gh/jandix/mediacloudr?branch=master)
<!-- badges: end -->

The goal of mediacloudr is to provide a consistent wrapper for the
mediacloud.org API. The Media Cloud platform is an open-source platform,
that collects all kind of news stories and provides various
functionalities to query, download and analyze them. This packages tries
to support R users by providing a set of functions to access various
functionalities of the
mediacloud.org.

## Installation

<!-- You can install the released version of mediacloudr from [CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("mediacloudr")
```
-->

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("jandix/mediacloudr")
```

## API key

Please [register](https://topics.mediacloud.org/#/user/signup) as a new
user. Afterwards, you can copy your API key from your [profile
page](https://topics.mediacloud.org/#/user/profile).

I suggest to save the API key to your R environment file. The R
environment file is loaded every time R is started/restarted. You should
not add the key to your scripts, because other users could misuse your
key. The following steps show how to add the key to your R environment
file.

1.  Open your .Renviron file. The file is usually located in your home
    directory. If the file does not exist, just create one and name it
    `.Renviron`.
2.  Add a new line and enter your API key in the following format:
    `MEDIACLOUD_API_KEY=<YOUR_API_KEY>`.
3.  Save the file and restart your current R session to start using
    mediacloudr.

## Request Limits

The mediacloud.org states the following for API request/rate limits:

“Each user is limited to 1,000 API calls and 20,000 stories returned in
any 7 day period. Requests submitted beyond this limit will result in a
status 403 error. Users who need access to more requests should email
<info@mediacloud.org>.”

## Examples

### Get a news story by id

You can query news stories by their ids. The ids can be found using the
graphical interface or using the `get_story_list` function.

*Note*: You don’t have to add the `api_key` argument if you followed the
steps to add the api key to your R environment file.

``` r
story_id <- 27456565L
story <- get_story(story_id = story_id)
```

### Get a list with news stories

You can query a list of news stories using `get_story_list`. You can use
the `q` and `fq` arguments to filter stories. A guide to the query
parameters can be found
[here](https://mediacloud.org/support/query-guide/).

*Note*: You don’t have to add the `api_key` argument if you followed the
steps to add the api key to your R environment file.

``` r
stories <- get_story_list(q = "trump")
```

### Get a media source by id

You can query media sources by their ids. The ids can be found using the
graphical online interface. mediacloud.org provides various meta data
for their media sources.

*Note*: You don’t have to add the `api_key` argument if you followed the
steps to add the api key to your R environment file.

``` r
media_id <- 1L
media_source <- get_media_source(media_id =  media_id)
```

### Download article and extract social media meta data

You can use the article URL to download the complete article and extract
social meta data. The meta data can be analyzed using techniques such as
sentiment analysis or simply compared to the article content.

``` r
# load httr
library(httr)
# define article url
url <- "https://bits.blogs.nytimes.com/2013/04/07/the-potential-and-the-risks-of-data-science"
# download article
response <- GET(url)
# extract article html
html_document <- content(response, type = "text", encoding = "UTF-8")
# extract meta data from html document
meta_data <- extract_meta_data(html_doc = html_document)
```
