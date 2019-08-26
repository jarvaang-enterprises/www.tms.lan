import json
import time
import os

from selenium.webdriver.common.keys import Keys
from selenium import webdriver
import selenium.common.exceptions as exc
from bs4 import BeautifulSoup
import requests
import filenameGen as fg
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
from selenium.webdriver.firefox.options import Options


def getHtml(html, fls, c_file):
    with open(fls, 'w') as s:
        s.write(str(html))
    c_file[fls] = 'written'


def getJson(fil, hotels):
    file_url = "https://www.tms.lan/ghls/"+fil
    response = requests.get(file_url, timeout=10, verify=False)
    content = BeautifulSoup(response.content, "html.parser")
    location = content.find('h2', attrs={"class": "QjOEYc doHftd"}).text
    num = content.find('h2', attrs={"class": "LxbR2d EaA2sf"}).text
    hotels.append(location)
    hotels.append(num)
    for hotel in content.findAll('c-wiz', attrs={"class": "nzwZbc", "jsrenderer": "kY4wqf", "jsshadow": "", "jsmodel": "hc6Ubd"}):
        try:
            thumbnail = hotel.find('img', attrs={"class": "wOQnuc U106ic q5P4L"})['src']
        except AttributeError:
            thumbnail = "blankimage.gif"
        except TypeError:
            thumbnail = "blankimage.gif"
        try:
            info = hotel.find('div', attrs={"class": "XhOl1c bWBoJf sIVqud"}).text
        except AttributeError:
            info = "No info found"
        except TypeError:
            info = "No info found"
        try:
            price = hotel.find('div', attrs={"class": "vvQAMb kb8rCf idHpEf"}).text
        except AttributeError:
            price = "Price unknown"
        except TypeError:
            price = "Price unknown"
        try:
            offer = hotel.find('div', attrs={"class": "g3U37c"}).text
        except AttributeError:
            offer = "No offer found"
        except TypeError:
            offer = "No offer found"
        try:
            rating = hotel.find('span', attrs={"class": "ehgVHb Ih19Ad"}).text
        except AttributeError:
            rating = "No rating found"
        except TypeError:
            rating = "No rating found"
        hotel_object = {
            "thumbnail": thumbnail,
            "hotelName": hotel.find('div', attrs={"class": "xk4lge zHGix ny8Bff"}).text,
            "info": info,
            "price": price,
            "offer": offer,
            "rating": rating
        }
        hotels.append(hotel_object)


def file_created(f):
    if os.path.exists(f):
        return True
    else:
        return False


def write_out(hotels):
    with open('hotelData.json', 'a+') as outfile:
        json.dump(hotels, outfile)


print('Booting ...')
time.sleep(2)
print('*****Loading Beautiful Soup ...')
time.sleep(2)
print('*****Loading requests libraries ...')
files = fg.getfilenames()
c_files = {}
hotelList = []
cap = DesiredCapabilities.FIREFOX
cap['pageLoadStrategy'] = "none"
opt = Options()
opt.add_argument('--headless')
browser = webdriver.Firefox(desired_capabilities=cap, options=opt)
wait = WebDriverWait(browser, 60)
url = 'https://www.google.com/travel/hotels?hrf=CgYIoMIeEAAiA1VHWCoWCgcI4w8QCRgDEgcI4w8QCRgEGAEgAbABAFgBaAhyAggCmgEw' \
      'EgdLYW1wYWxhGiUweDE3N2RiYzBmOWQ3NGIzOWI6MHg0NTM4OTAzZGQ5NmI2ZmVjogETCggvbS8wZm5neRIHS2FtcGFsYaoBCgoCCBwSAghHG' \
      'AGqAQ8KAgguEgMIggESAggMGAGSAQIgAQ&tcfs=Ei0KCC9tLzBmbmd5EgdLYW1wYWxhGhgKCjIwMTktMDktMDMSCjIwMTktMDktMDQYAiIYCg' \
      'oyMDE5LTA5LTAzEgoyMDE5LTA5LTA0UgA&rp=OAFIAg&ap=MAFanQEKBgigwh4QACIDVUdYKhYKBwjjDxAJGAMSBwjjDxAJGAQYASABsAEAWA' \
      'FoAXICCAKaATASB0thbXBhbGEaJTB4MTc3ZGJjMGY5ZDc0YjM5YjoweDQ1Mzg5MDNkZDk2YjZmZWOiARMKCC9tLzBmbmd5EgdLYW1wYWxhqgE' \
      'KCgIIHBICCEcYAaoBDwoCCC4SAwiCARICCAwYAZIBAiABaAA&destination=Kampala'
print('Initializing...')
browser.get(url)
print('Scrapping')
try:
    wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, 'div.kK2YDd')))
except exc.TimeoutException:
    print('Please check your Internet Connection,\nPage load is slow')
    browser.quit()
    exit(1)
time.sleep(10)
t = 1
uf = 0
while t == 1:
    h = browser.page_source
    print('Page ' + str(uf+1) + ' done')
    getHtml(h, files[uf], c_files)
    if uf is 0:
        snext = browser.find_element_by_xpath(
            "/html/body/c-wiz[2]/div/c-wiz/div/div[1]/div/div[4]/div/div[2]/c-wiz/div[6]/div/div/div[2]")
        browser.execute_script("arguments[0].click();", snext)
        wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, 'div.kK2YDd')))
        time.sleep(5)
    else:
        try:
            snext = browser.find_element_by_xpath(
                "/html/body/c-wiz[2]/div/c-wiz/div/div[1]/div/div[4]/div/div[2]/c-wiz/div[6]/div[2]/div")
            browser.execute_script("arguments[0].click();", snext)
            wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, 'div.kK2YDd')))
            time.sleep(5)
        except TimeoutError:
            t = 0
            os.remove(files[uf])
            print('Error: Hotel List not Found...')
            print('Shutting Down Scraper ...')
            time.sleep(2)
            print('Creating organised tables and listings from the collected raw data')
            for file in files:
                if file_created(file):
                    getJson(file, hotelList)
                    os.remove(file)
            write_out(hotelList)
            os.rename('hotelData.json', 'rKData.json')
        except exc.NoSuchElementException:
            print('Error: Next Button not Found.')
            t = 0
            os.remove(files[uf])
            print('Shutting Down Scraper ...')
            time.sleep(2)
            print('Creating organised tables and listings from the collected raw data')
            for file in files:
                if file_created(file):
                    getJson(file, hotelList)
                    os.remove(file)
            write_out(hotelList)
            os.rename('hotelData.json', 'rKData.json')

    uf += 1
    if uf == 63:
        t = 0
        print('Success: All Hotels received.')
        print('Shutting Down Scraper ...')
        time.sleep(2)
        print('Creating organised tables and listings from the collected raw data')
        for file in files:
            if file_created(file):
                getJson(file, hotelList)
                os.remove(file)
        write_out(hotelList)
        os.rename('hotelData.json', 'rKData.json')
