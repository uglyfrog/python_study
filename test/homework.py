import re

# 1-2
text2 =  input("enter your name: \n")
text1 = "ren dong"
m1 =  re.match(r"(\w+)\s(\w+)",text2)
if m1:
     print("1-2 homework:")
     print ("1:",m1.group(1),"2:",m1.group(2))
     print ("----------")

# 1-5
text2 = "3120 De la Cruz Boulevard Test"
m2 = re.findall( r'(\d+)\s([\w ]*)',text2)
if m2:
    print (m2)
    print ("----------")

# 1-5
text3 =  "http://www.yahoo.net/"  #edu,net
m3 = re.findall(r'^(www|http)://www.(\w+)(.com|.edu|.net)/', text3)
if m3:
    print (m3)
    print ("----------")