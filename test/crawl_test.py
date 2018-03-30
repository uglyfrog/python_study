import urllib2
import urllib

request = urllib2.Request("http://www.baidu.com")
response = urllib2.urlopen(request)

values={}
values['username'] = "1016903103@qq.com"
values['password'] ="XXXX"
data = urllib.urlencode(values)
print (data)
# print response.read()