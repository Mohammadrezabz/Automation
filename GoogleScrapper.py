import requests
from bs4 import BeautifulSoup as bs
import argparse
import re
parser = argparse.ArgumentParser(description='Google Search Scrapper')
parser.add_argument('-u','--url',type=str,required=True)
args = parser.parse_args()
def scrapper(target):
    url = f'https://google.com/search?q=site%3A{target}+-www.tesla.com'
    req = requests.get(url)
    webPage = req.text
    html= bs(webPage, 'html.parser')
    #content = html.get_text()
    for link in html.find_all(string=re.compile(f'{target}')):
        print(link)

if __name__ == '__main__':
    scrapper(args.url)

