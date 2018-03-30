# f = open('C:/火蛙文档2.txt','r')
# f1= open('C:/火蛙文档3.txt','w')
# for each_line in f:
#     print(each_line,each_line.rstrip())
#     f1.write(each_line)
# f.close()
# f1.close()

class Turtle:
    color = 'green'
    weight = 10
    legs =4
    shell = True
    mouth = '大嘴'

    def __init__(self,name):
        self.name = name


    def climb(self):
        print('%s我会爬行' % self.name)

    def bite(self):
        print('我会咬人哦')

f = Turtle('任楚飞')
f.climb()
f.bite()


# list1 = [5,6,1,2,7,9,4]
# list1.sort()
# list1.append(0)
# list1.append('hey')
# print(list1)
