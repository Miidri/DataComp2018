# BeautifulSoup
from bs4 import BeautifulSoup
# Selenium
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
# 数値抽出
import re

URL_BASE = 'https://tv.yahoo.co.jp/listings/23/?&s=1&va=6&vb=1&vc=0&vd=0&ve=1&'

def getSource(url):
  options = Options()
  options.add_argument('--headless')
  driver = webdriver.Chrome('chromedriver', chrome_options=options)
  driver.get(url)
  data = driver.page_source.encode('utf-8')
  driver.quit()
  return data

print('年月日?(yyyymmdd)')
d = input()
print('時?')
st = input()
print('チャンネル?')
ch = input()


url = URL_BASE + 'd=' + d + '&st=' + st
source = getSource(url)
soup = BeautifulSoup(source, 'lxml')
samp = soup.find_all(class_='channel8')[1]

tr_arr = samp.find('tbody').find_all('tr')

for tr in tr_arr:
  pos = 0
tr_id = 'NaN'
ids = tr.get('id')
if ids:
  tr_id = ids[0]
if tr_id == 'ListingsFooter':
  break
cl = tr.find('td').get('class')[0]
if cl != 'n':
  td_arr = tr.find_all('td')
hit = False
for td in td_arr:
  if hit:
  break
td_time = 'NaN'
name = 'NaN'
if td.span:
  if td.span.span:
  td_time = td.span.span.text
else:
  continue
else:
  continue
a = td.span.find('a')
if a:
  data_ylk = a.get('data-ylk')
pos = re.sub(r'\D', '', data_ylk)
if pos == ch:
  name = a.text
hit = True
else:
  continue
if name != 'NaN':
  print('{} {}'.format(td_time, name))
