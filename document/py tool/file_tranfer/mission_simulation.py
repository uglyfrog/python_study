import math
import random
#import sys

mission_target = {"probe":10,"oxygen":100,"algae":1500,"grass":4000000,"tree":2000,"worm":400,"fish":250,"arthropod":50,"terraform":2500000,"copper":20,"uranium":12}
mission_objective = list(mission_target.keys())
mission_status = []
mission_count = []
mission_complete = False
test_num = 1000
step = 0

## 初始化任务进度和任务计数
def init_mission():
    for i in range(len(mission_objective)):
        mission_status.append(0)
        mission_count.append(0)

## 任务完成的提示
def update_mission_player():
    if (mission_complete):
        print("\nall mission accomplished!!!")
        print("mission steps are : ", step, "\n")
        #sys.exit(0)

def set_mission_goal(goal,amount):
    global mission_count
    global mission_status
    global mission_complete
    count = mission_count
    status = mission_status

    ## 任务计数最大为任务目标数量的4倍
    count[goal] = min(max(amount,0),(mission_target[mission_objective[goal]]*4))
    status[goal] = math.floor(10 * min(100, 100 * count[goal] / mission_target[mission_objective[goal]])) / 10

    ## 2、3、4号任务——通过计算水藻、草、树的数量获得氧气值
    if ( goal >= 2 and goal <= 4):
        algae_oxgen = (50 * count[2])/(count[2] + mission_target[mission_objective[2]]/2)
        grass_oxgen = (20 * count[3])/(count[3] + mission_target[mission_objective[3]]/2)
        tree_oxgen =  (30 * count[4])/(count[4] + mission_target[mission_objective[4]]/2)
        total_oxgen = algae_oxgen + grass_oxgen + tree_oxgen

        ## 氧气的任务计数
        count[1] = (107 * total_oxgen) / ( 150 - total_oxgen)
        status[1] = math.floor(10 * min(100, 100 * count[1] / mission_target[mission_objective[1]])) / 10

    mission_count = count
    mission_status = status

    ## 检测所有分支任务是否完成
    any = False
    for i in range(len(mission_objective)):
        if (status[i] < 100):
            any = True
        print(mission_objective[i]," status is : ",status[i])
    print("--------------------------------------------")

    ## 所有分支任务完成则终极目标达成
    if (not any):
        mission_complete = True

    update_mission_player()


if __name__ == "__main__":
    init_mission()

    for i in range(test_num):
        step = i
        for j in  range(len(mission_objective)):
            if (mission_complete):
                break
            if j == 0 or j == 9 or j == 10:
                set_mission_goal(j,mission_count[j]+1)
            if j == 2 or j == 4 or j ==5 or j == 6 or j == 7: 
                set_mission_goal(j,mission_count[j] + random.randrange(1,50))
            if j == 3 or j == 8:
                set_mission_goal(j,mission_count[j] + random.randrange(100,10000))
            if j == 1:
                continue
        

