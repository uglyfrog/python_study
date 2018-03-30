def fabnacc(num):
    if (num<=1):
        return num
    return fabnacc(num-1) + fabnacc(num -2)

def main():
    num = int(input("请输入数字："))
    if (isinstance(num, int)):
        print(fabnacc(num))
    else:
        print("请输入合法数字")
        return

if __name__ == '__main__':
    main()