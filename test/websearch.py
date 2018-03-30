import urllib
import json
from urllib import request
from urllib import parse
import time
from bs4 import BeautifulSoup


# import io
# import sys
# sys.stdout = io.TextIOWrapper(sys.stdout.buffer,encoding='utf-8')

# from urllib.request import urlopen


# res = urlopen("http://www.baidu.com")
# htmlBytes = res.read()
# # print(htmlBytes.decode('utf-8'))


url = 'https://movie.douban.com/j/search_tags?type=movie'
result = request.urlopen(url,timeout=20).read()
# 加载json为字典
result = json.loads(result)
# print(result)
tags = result['tags']

movies = []
tagnum = 0

for tag in tags:
    start = 0
    tagnum += 1
    # tag = parse.unquote_plus(tag)
    while True:
        print(tag)
        # 网页打开不支持汉字，parse.quote_plus(tag)转为utf8码
        url1 = 'https://movie.douban.com/j/search_subjects?type=movie&tag=' + parse.quote_plus(tag) + '&sort=recommend&page_limit=20&page_start=' + str(start)
        # print(url1)
        result1 = request.urlopen(url1, timeout=20).read()
        result1 = json.loads(result1)
        result1 = result1['subjects']

        if len(result1) ==0:
            break

        for item in result1:
            movies.append(item)
        # print(movies)
        start += 20
    #打印3个tag
    if tagnum == 3:
        break

print(len(movies))

try:
    for num in range(0,len(movies)):
        url = movies[num]['url']
        result = request.urlopen(url, timeout=20).read()
        html = BeautifulSoup(result,"lxml")


        try:
            # 尝试提取电影简介
            description = html.find_all("span", attrs={"property": "v:summary"})[0].get_text()
            # description = description.encode('gbk').decode('gbk')
            # print(description)
            description = description.encode('gbk', errors='backslashreplace').decode("gbk")
            # print(description)
        except Exception as e:
            # 没有提取到简介，则简介为空
            print(e)
            movies[num]['description'] = str(e)
        else:
            # 将新获取的字段填入movies
            # description = description.encode('utf-8').decode('utf-8','replace')
            movies[num]['description'] = description
            print( movies[num]['description'])
        finally:
            pass

        time.sleep(1.5)
except Exception as e:
    print('%s——%d has error %s'%(movies[num]['title'],num,description))
    print(e)
    pass

fw = open("moives1.csv","a+")

for item in movies:
    text = str(item['description'])
    print(text)
    fw.write(item['title'] + ',' + item['rate'] + ',' + item['url'] + ',' + item['cover'] + ',' + item['id'] +  ',' + ''.join(text.split()))
    fw.write('\n')
    # fw.write(item['title'] + ',' + item['rate'] + ',' + item['url'] + ',' + item['cover'] + ',' + item['id'] +  '\n')
fw.close