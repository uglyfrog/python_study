import random
import traceback

# 打印迷宫
def print_maze (max_x,max_y,maze=[]):
    for n in range(0,max_x):
        # print('|',end="")
        for m in range(0,max_y):
            print("| %2s" %(maze[n][m]), end='')
        print(' |')


# def initalmaze(max_x,max_y,length):
#     maze = [[' ' for col in range(max_y)] for row in range(max_x)]
#     for n in range(0, max_x):
#         for m in range(0, max_y):
#             maze[n][m] = " "
#
#     maze[startX][startY] = 1
#     count = 1
#     checkaround = False
#     lengthnum = length
#
#     return maze,count,checkaround,lengthnum


def generate_maze ( max_x = 10, max_y = 10, length = 5):
    # 生成迷宫，默认用0填充
    maze = [[' ' for col in range(max_y)] for row in range(max_x)]
    for n in range(0, max_x):
        for m in range(0, max_y):
            maze[n][m] = " "

    # 生成迷宫最开始的起点，这里设置起点为迷宫总宽的1/2、长为0的位置。标识为1
    startX,startY = max_x // 2,0
    maze[startX][startY] = 1
    count = 1
    checkaround = False
    lengthtemp = length

    # 根据最大迷宫长度随机房间
    while length-1 :
        # random.shuffle(direction)
        # for random_direction in direction:
        #     tempX, tempY = get_next_area_pos(startX, startY)
        # 获取随机的X,Y坐标

        try:
            checkaround = isinstance(maze[startX+1][startY],int) and isinstance(maze[startX-1][startY],int) and isinstance(maze[startX][startY+1],int) and isinstance(maze[startX][startY-1],int)
        except Exception as e:
            print("num is wrong: %d,%d——%s"%(startX,startY,maze[startX][startY]))
            print(checkaround)

        if checkaround:
            print("=========try again===========")
            for n in range(0, max_x):
                for m in range(0, max_y):
                    maze[n][m] = " "

            # 生成迷宫最开始的起点，这里设置起点为迷宫总宽的1/2、长为0的位置。标识为1
            startX, startY = max_x // 2, 0
            maze[startX][startY] = 1
            count = 1
            checkaround = False
            length = lengthtemp
            continue

        tempX, tempY = get_next_area_pos(startX, startY)

        # 如果坐标超越边界则返回
        if tempX >= max_x or tempX < 0 or tempY >= max_y or tempY < 0:
            continue

        # 如果坐标已经占有则返回

        if isinstance(maze[tempX][tempY],int):
            # if maze[tempX][tempY]>=1:
            continue
        else:
            startX, startY = tempX,tempY
            length -=1
            count +=1
            maze[startX][startY]= count

    print_maze(max_x,max_y,maze)

# 随机生成迷宫的方向


def get_next_area_pos(x,y):
    direction = random.randint(1, 4)
    if direction == 1:  # Top
        y -= 1
    elif direction == 2:  # Right
        x += 1
    elif direction == 3:  # Bottom
        y += 1
    elif direction == 4:  # Left
        x -= 1
    return x, y

def main():
    try:
        # x, y = (int(a) for a in input("迷宫长度和宽度（数字用空格隔开）：").split(' '))
        # z =  int(input("迷宫最小区域长度 ："))
        x,y = 10,10
        z = 20
        try:
            for num in range(1,3):
                generate_maze(x, y, z)
                print("================")
        except Exception as e:
            print("确定长度和宽度为合法自然数！"+repr(e))
            print(traceback.print_exc())
    except Exception as e:
        print("确定长度和宽度为用空格隔开！" )

if __name__ == '__main__':
    main()

