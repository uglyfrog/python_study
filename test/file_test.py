import re
from time import ctime

f1 = open('tasklist2.txt','w')
f = open('tasklist.txt','r')
for eachline in f:
    print(re.findall(r'([\w.]+(?: [\w.]+)*)\s\s+(\d+) \w+\s\s+\d+\s\s+([\d,]+ K)',eachline.rstrip()))
    f1.write(eachline.rstrip() + " hello\n")
f.close()
f1.close()
# f1 = open('tasklist2.txt','w')
# for eachline in f1:
#     f1.write(re.findall(r'([\w.]+(?: [\w.]+)*)\s\s+(\d+) \w+\s\s+\d+\s\s+([\d,]+ K)'))
# #    print re.split(r'\s\s+',eachline.rstrip())
# f1.close()

dtstr = ctime(2)

print(dtstr)