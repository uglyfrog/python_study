import re

# s = "人uglyfrog78@gmail.com"
# email_regex = re.compile("[\w\.]+@[a-zA-Z\d]+\.(com|cn)")
# print(email_regex.match(s))

# s = '''first line
# second line
# third line'''
# #
# regex = re.compile(".+")
#
# print(regex.findall(s))


#
# s = 'Hello, Mr.Gumby : 2016/10/26  Hello,r.Gumby : 2016/10/26'
#
# # 不加环视限定
# print(re.compile("\w+\.\w+").findall(s))
# print(re.compile("\w+\,\s").findall(s))
#
# print(re.compile("(?P<name>\w+\.\w+)").findall(s))
# print(re.compile(r"(?<=Hello, )(?P<name>\w+\.\w+)").findall(s))
# print(re.compile(r"(?=M)(?P<name>\w+\.\w+)").findall(s))
#
#
# print("--------------")
# str = "reading a book"
# pattern = re.compile(r"(?<=\bre)\w+\b")
# print(re.findall(pattern,str))
#
# print("--------------")
# harsh_str = ['hello','Cat',' cat','cat h','CAT','CAt-h','Cat_h']
# p = re.compile(r'\bcat\b', re.I)
# p1 = re.compile(r'\bcat h\b', re.I)
# p2 = re.compile(r'\bcat-h\b', re.I)
# print([s for s in harsh_str if re.search(p, s)])
# print([s for s in harsh_str if re.search(p1, s)])
# print([s for s in harsh_str if re.search(p2, s)])
#
# print("--------------")
# s = 'CAt-h'
# print(re.compile(r'\bcat\b',re.I).search(s))
#
# m = re.match('hel','hello')
# print(m.group())
# m = re.search('ll','hello')
# print(m.group())

import os
f = os.popen('tasklist /nh', 'r')
f1 = open("tasklist.txt", "w")
for eachline in f:
    print(re.findall(r'([\w.]+(?: [\w.]+)*)\s\s+(\d+) (\w+)\s\s+\d+\s\s+([\d,]+ K)', eachline.strip()))
    f1.write(eachline.strip()+"\n")
f.close()
f1.close()