import requests

r = requests.get('https://alpha.wallhaven.cc/random')
num = r.text.split('href="')[29][0:100].split('/')[4].split('"')[0]
r = requests.get('https://wallpapers.wallhaven.cc/wallpapers/full/wallhaven-'+str(num)+'.jpg')
open('../wall','wb+').write(r.content)
