# crow program info
# url: http://timetable.yanbe.net/?p=13
import requests, logging, sys, urllib, re
from bs4 import BeautifulSoup

## make url
date = '2018/11/06'
plus = '_1.html?13'
URL_BASE = 'http://timetable.yanbe.net/html/13/'
url = URL_BASE + date + plus
## crow
resp = requests.get(url)
soup = BeautifulSoup(resp.content, 'html.parser')
## 番組名, 番組情報
program_name = soup.find_all("a",href = re.compile("^http://timetable.yanbe.net/pdv.cgi"))
program_info = soup.find_all("span",class_ = "program_contents")

for tr in program_name:
  print(tr.string)

for tr in program_info:
  print(tr.string)
