import re
bt = 'is|cool|clever'
text = "JGood is a handsome boy, he is cool, clever, and so on..."
m = re.match(r"(\w+)\s+(\w+)\s", text)
if m:
#    print m.group()
    print(m.group(0),'\n',m.group(1),'\n',m.group(2))
    print('------------')
else:
    print('not match')

m = re.search(bt,text)
if m:
    print(m.group(),'\n',m.groups())
    print('------------')
else:
    print('not match')
# m  = re.finditer(r'(i\w+) a (han\w+)',text)
# print(m.next().groups())
# print('------------')
# # print m.next().group(2)
#
# m=re.match(r'(\bJG\w+)',text)
# if m:
#     print(m.group())
# else:
#     print('not match')

pattern = r'^(www)\:?(\/\/)?(\w+\.)+(com)$'

text = "www://www.baidu.com"

print(re.match(pattern,text).group())