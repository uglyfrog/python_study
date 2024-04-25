import os
import xlwt
import re


os.chdir('E:\WorkShop\Documents\浩瀚星辰\太空探索\lua')
a = os.getcwd()
print(a)

with open('recipe-update.lua','r',encoding= 'utf-8') as origin_file, open('output1.txt','w',encoding = 'utf-8') as des_file:
    for line in origin_file.readlines():
        if line.split():
            des_file.write(line)

with open('recipe-final.lua','r',encoding= 'utf-8') as origin_file, open('output2.txt','w',encoding = 'utf-8') as des_file:
    for line in origin_file.readlines():
        if line.split():
            des_file.write(line)


with open('recipe.lua','r',encoding= 'utf-8') as origin_file, open('output3.txt','w',encoding = 'utf-8') as des_file:
    for line in origin_file.readlines():
        if line.split():
            des_file.write(line)

workbook = xlwt.Workbook(encoding='utf-8',style_compression=0)

sheet = workbook.add_sheet('recipes', cell_overwrite_ok = False)

num1,num2,num3 = 1,1,1

sheet.write(0,0,'product')
sheet.write(0,1,'recipe group')
sheet.write(0,2,'product num')


def write_to_excel(n1,n2,n3,num):
    result1 = []
    result2 = []
    result3 = []

    global num1,num2,num3
    n1,n2,n3 = num1,num2,num3

    filename = "output" + str(num) + ".txt"

    with open(filename, 'r+') as fd:
        rule1 = r'\sname = "(.+)"'
        rule2 = r'\s*{type="item", name="(.+)", amount=(\d)'
        rule3 = r'\s*results= { {type="item", name=\S*\samount=(\d+)'

         #   results= { {type="item", name="engine-unit", amount=1} }

        for text in fd.readlines():
            #获得生产品名称
            content1 = re.findall(rule1,text)
            if content1:
                result1.append(content1)
            #result1 = list(filter(None,result1)) #去除空值

            #获得生产品的配方，但是有重复
            content2 = re.findall(rule2,text)
            if content2:
                content2_modify = "".join(content2[0])
                result2.append(content2_modify)
            content2_modify = ""
            #获得生产品的个数
            content3 = re.findall(rule3,text)
            if content3:
                result3.append(content3)



        for content1 in result1: #写入要合成的物品名称
            sheet.write(n1,0,content1)
            n1= n1+1
            num1 = n1

        for content2 in result2: #写入配方名称
            sheet.write(n2,1,content2)
            n2 = n2+1
            num2 = n2

        for content3 in result3: #写入配方名称
            sheet.write(n3,2,content3)
            n3 = n3 + 1
            num3 = n3
    

    workbook.save('des_file.xls')
    return


write_to_excel(num1,num2,num3,1)
write_to_excel(num1,num2,num3,2)
write_to_excel(num1,num2,num3,3)