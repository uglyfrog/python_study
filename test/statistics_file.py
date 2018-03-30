import sys
import io
import re


# sys.stdout = io.TextIOWrapper(sys.stdout.buffer,encoding='gb18030')


characters = []
stat = {}
specialword = {}
words={}
count=[]

with io.open('xyj.txt',encoding='UTF-8') as f:
    line = f.read()
    line = line.strip()

    word = ['孙悟空','猪八戒','唐僧','沙悟净']


    for i in range(0,len(word)):
        # print(word[i])
        words = re.findall(word[i],line)

        # 方法一：直接统计list的长度就是统计数字数量
        count.append(len(words))

        # 方法二：dict计数统计字的数量
        for word[i] in words:
            specialword[word[i]] = specialword.get(word[i], 0) + 1

    fw = open("result.csv", "w")
    fw1 = open("result1.csv", "w")

    # 直接打印list的长度就是统计数字数量
    for i in range(0,len(word)):
        print(word[i] + ": " + str(count[i]))
        fw.write(word[i] + "," + str(count[i]) + "\n")
    fw.close()

    print("---------------------")

    # 直接打印dict的元素就是统计数字数量
    for k,v in specialword.items():
        print(k,"：",str(v))
        fw1.write(k + ", " + str(v) + "\n")
    fw1.close()


    # for item in stat:
    #     fw.write(item[0]+","+str(item[1])+"\n")




    #
    # for i in range(0,len(word)):
    #     for word[i] in words:
    #         specialword[word[i]] = specialword.get(word[i], 0) + 1
    #         print(word[i])
    #         print(specialword[word[i]])
    # #     print(specialword)
    # for item in specialword:
    #     print(item[0] + ":" + str(item[1]))

    # for x in range(0,len(line)):
    #     if not line[x] in characters:
    #         characters.append(line[x])
    #
    #     if not line[x] in stat:
    #         stat[line[x]] = 0
    #     stat[line[x]] += 1


# for x in range(0,len(characters)):
#     print(characters[x],end="")
#
# print("\n")

# stat = sorted(stat.items(), key=lambda d:d[1], reverse=True)
#
# fw = open("result.csv","w")
#
# for item in stat:
#     fw.write(item[0]+","+str(item[1])+"\n")
# fw.close()

# for k,v in stat.items():
#     fw.write(k+","+str(v)+"\n")
#     print(k,",",str(v))



