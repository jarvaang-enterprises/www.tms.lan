def getfilenames():
    files = []
    for i in range(62):
        files.append('hotel'+str(i)+'.html')
    return files


if __name__ == '__main__':
    file = getfilenames()
