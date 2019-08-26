import json
with open('hotelData.json') as hotelJson:
    hotels = json.load(hotelJson)
count = 0
for i in hotels:
    if count == 0:
        print(i)
        print('\n')
        count += 1
    else:
        print(i['hotelName'])
        count += 1
