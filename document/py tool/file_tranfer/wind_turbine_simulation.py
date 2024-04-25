import math
import random

wind_factor = 0.7
wind_speed  = 0.4
wind_momentum = 0
day_time = 0.25
ticks = 1000000
speed = 1

current_power = [0]*3

## 数据离散化函数
def discretize(x):
    return math.floor((x*1048576)+0.5)/1048576

def update_wind(game_tick):
    global wind_factor
    global wind_momentum
    global wind_speed
    global day_time

    #风力发电机功率/tick
    base_wind_power = [1500000/60, 4000000/60,12000000/60]

    #模拟风电的波峰波谷电力变化
    wave1 = math.sin(discretize((day_time+0.075)*6.2832))
    wave2 = math.sin(discretize((game_tick % 75787) * 0.001160682))
    wave3 = math.sin(discretize((game_tick % 291113)* 0.0001295004 + 2.5))
    wave4 = math.sin(discretize((game_tick % 1023487)*0.000055251 + 4.4))
    wave = discretize((wave1*1.25) + wave2 + wave3 + (wave4 * 0.75))

    #print("wave1：",wave1)
    #print("wave2：",wave2)
    #print("wave3：",wave3)
    #print("wave4：",wave4)
    #print("wave：",wave)

    noise = random.randrange(0,1)*3 + random.randrange(0,1)*5
    momentum = discretize((wind_momentum * 0.9985) + random.randrange(0,1)*0.16 - 0.08)
    target = (wave + noise + momentum - 0.1)/6
    delta = discretize((random.randrange(0,1)*0.25) + 0.05)
    factor = discretize(wind_factor * (1-delta) + delta * target)


    #print("wave : ","\t",wave)
    #print("wind_momentum : ","\t",wind_momentum)
    #print("target : ","\t",target)
    #print("factor : ","\t",factor)

    wind_momentum = momentum
    wind_factor = factor


    if (factor <= 0):
        wind_speed = 0
    elif (factor >= 1.25):
        wind_speed = 1
    elif (factor >= 1):
        wind_speed = discretize((factor * 0.4) + 0.5)
    else:
        wind_speed = discretize(factor * factor * 0.9)

    for i in range(len(base_wind_power)):
        current_power[i] = wind_speed * base_wind_power[i]
        print("current_power : ",current_power[i])
    print("--------------------------")
           
def update(game_tick):
    global day_time
    if (game_tick % 101 ==2):
        update_wind(game_tick)
        if(game_tick % 250 == 0 ):
            if (day_time < 1):
                day_time = day_time + 0.01
            else:
                day_time = 0

def on_nth_tick(tick_num):
    global speed
    speed = max(0.001,(speed - 0.002 + random.randrange(0,1)*0.004)*0.975+0.00052)
    print(speed)



if __name__ == "__main__":
    #for i in range(1,20):
    #    on_nth_tick(1);
    
    for i in range(1,ticks):
        update(i)