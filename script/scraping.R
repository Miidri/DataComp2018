library(rvest)
library(tidyverse)
library(stringr)
date = '2018/11/06'
plus = '_1.html?13'
URL_BASE = 'http://timetable.yanbe.net/html/13/'

url <- str_c(URL_BASE,date,plus)
tmp <- html_table(read_html(url), header=FALSE)
