import re

patt1 = '^(bat|bit|but|hat|hit|hut)'
data1 = 'bat'
print re.match(patt1, data1).group()

patt2='(\w+)\s(\w+)'
data2='ren dong'
print re.match(patt2,data2).group()