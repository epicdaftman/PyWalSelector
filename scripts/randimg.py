#Made by daft https://github.com/epicdaftman
import requests

def main():
  img = getImg()
  print(img)
  while img[::-1][0:4] != 'gpj.': #Test to see if the image is a jpg.
    print(img)
    img = getImg()
  r = requests.get('https://'+img)
  open('/home/daft/.config/i3/wall','wb+').write((r.content))


def getImg():
  r = requests.get('https://imgur.com/random') #Load the random image page
  return r.text.split('src="')[3][2:].split('"')[0] #Magic
    
main() 
