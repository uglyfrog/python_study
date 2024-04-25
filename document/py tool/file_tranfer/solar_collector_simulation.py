solar_values = [
    { "ratio":7.36, "max_temp":250, "threshold":25},
    { "ratio":6.07, "max_temp":300, "threshold":50},
    { "ratio":5.13, "max_temp":400, "threshold":100},
    ]

##  morning1—>dusk—>evening—>dawn
#timeline = {"morning1":0.25,"dusk":0.45,"evening":0.65,"morning2":0.75,"dawn":1}
timeline = {"morning": 0,"dusk":0.5,"evening":0.75,"dawn":1}

gametick = 20000
daytime = 0.25
solar_power_multiplier = 1
temperature =200
neighbour_bonus = 0.1


def update_solar(level,gametick):
    global temperature
    global daytime
    if(gametick % 250 == 0 ):
        if (daytime < 1):
            daytime = daytime + 0.01
        else:
            daytime = 0
    for i in range(0,1):
        dayt = daytime
        #print("daytime: ",dayt)
        light = 1
        if dayt > timeline["morning"] and dayt < timeline["dusk"]:
            light = (dayt - timeline["morning"]) / ( timeline["dusk"] - timeline["morning"])
        elif  dayt > timeline["dusk"] and dayt < timeline["evening"]:
                light = (timeline["evening"] - dayt) / (timeline["evening"] - timeline["dusk"])
        elif  dayt > timeline["evening"] and dayt < timeline["dawn"]:
            light = (dayt - timeline["evening"]) / ( timeline["dawn"] - timeline["evening"])
        else:
            light = 0
        light = light * solar_power_multiplier

        vals = solar_values[level]
        realtemp = temperature
        basetemp = max(realtemp,175)
        if(basetemp < vals["max_temp"]):
            target = vals["max_temp"] * ( light + 0.1) - basetemp
            if (target > 0):
                adjust = vals["ratio"] * ( 1 + neighbour_bonus ) * light
                if(target < vals["threshold"]):
                    adjust = adjust * (target / vals["threshold"])
                temperature = min(vals["max_temp"],(realtemp + adjust))
        print("collector-",level+1,": ",temperature)

if __name__ == "__main__":
    for i in range(3):
        for j in range(1,gametick):
            update_solar(i,j)
        temperature = 200    