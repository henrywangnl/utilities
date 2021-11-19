# load libraries

library(gh)
library(tidyverse)
library(listviewer)

# rate limit function
gh_api <- ratelimitr::limit_rate(
  gh,
  ratelimitr::rate(n = 4900, period = 3600)
)

# main function
get_stargazers <- function(repo_url) {
  # prepare api call url from repo url
  api_url <- paste0(
    "https://api.github.com/repos",  
    sub(".*github.com", "", repo_url), 
    "/stargazers"
  )
  
  # get stargazers overall information
  stars <- gh_api(api_url, per_page = 100, .limit = "Inf",
                  .accept = "application/vnd.github.v3.star+json") %>% 
    map(flatten)
  
  # get user information of each stargazer
  users <- map(stars, "url") %>% map(gh_api)
  
  # tidy the results
  tibble(
    starred_at = map_chr(stars, "starred_at"),
    map_df(users, flatten)
  )
}

# test
kafka_docker <- get_stargazers("https://github.com/wurstmeister/kafka-docker")
