from bs4 import BeautifulSoup
import requests
import filenameGen as fg
import json
import time
import os


def getImages(html, fls, c_file):
    with open(fls, 'w') as s:
        s.write(str(html))
    c_file[fls] = 'written'


def getJson(fil, hotels):
    file_url = "https://www.tms.lan/ghls/" + fil
    response = requests.get(file_url, timeout=10, verify=False)
    content = BeautifulSoup(response.content, "html.parser")
    location = content.find('h2', attrs={"class": "QjOEYc doHftd"}).text
    hotels.append(location)
    num = content.find('h2', attrs={"class": "LxbR2d EaA2sf"}).text
    hotels.append(num)
    for hotel in content.findAll('c-wiz', attrs={"class": "nzwZbc", "jsrenderer": "kY4wqf", "jsshadow": "", "jsmodel": "hc6Ubd"}):
        hotelImages = []
        hotel_name = hotel.find('div', attrs={"class": "xk4lge zHGix ny8Bff"}).text
        images = hotel.findAll('div', attrs={"class": "zfeKmf SV2nb", 'role': 'listitem', 'jsname': 'CmABtb', 'jsaction': 'rcuQ6b:npT2md;'})
        try:
            thumbnail = hotel.find('img', attrs={"class": "wOQnuc U106ic q5P4L"})['src']
        except AttributeError:
            thumbnail = "https://www.tms.lan/images/blankimage.png"
            # images = hotel.findAll('img', attrs={"class": "zfeKmf SV2nb"})
        except TypeError:
            thumbnail = "https://www.tms.lan/images/blankimage.png"
            # images = hotel.findAll('img', attrs={"class": "zfeKmf SV2nb"})
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
            "hotelName": hotel_name,
            "info": info,
            "price": price,
            "offer": offer,
            "rating": rating
        }
        for img in images:
            try:
                i = img.find('img', attrs={'class': 'wOQnuc U106ic q5P4L'})['src']
            except KeyError:
                i = img.find('img', attrs={'class': 'wOQnuc U106ic q5P4L'})['data-src']
            except TypeError:
                i = 'https://www.tms.lan/images/blankimage.png'
                TypeError('Source not found')
            hotelImages.append(i)
        writeImages(hotel_name, hotelImages)
        hotels.append(hotel_object)


def write_out(hotels):
    with open('hotelData.json', 'w+') as outfile:
        json.dump(hotels, outfile)


def writeImages(fileName, images):
    with open('img/'+fileName + '.json', 'w+') as imgfile:
        json.dump(images, imgfile)


def file_created(f):
    if os.path.exists(f):
        return True
    else:
        return False


def getimgnames():
    imgs = []
    for i in range(9):
        imgs.append('image_src'+str(i))
    return imgs


hotelList = []
files = fg.getfilenames()
img_files = getimgnames()
for file in files:
    if file_created('h/'+file):
        getJson('h/'+file, hotelList)
write_out(hotelList)
os.rename('hotelData.json', 'rKData.json')
