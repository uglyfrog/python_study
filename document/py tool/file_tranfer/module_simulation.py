## [产能加成，速度加成，效能加成]
speed_module = [[0,0.15,0],[0,0.2,0],[0,0.3,0.05],[0,0.4,0.1]]
haste_module = [[0,0.2,0.25],[0,0.3,0.4],[0,0.4,0.6],[0,0.5,0.8]]
yield_module = [[0.03,-0.05,0.1],[0.05,-0.15,0.4],[0.07,-0.25,0.7],[0.08,-0.4,1]]
productivity_module = [[0,0,0],[0.04,0,0],[0.06,0,0.05],[0.07,0,0.1]]
efficiency_module = [[0,0,0],[0,0,0],[0,0,-0.5],[0,0,-0.8]]

## 计算插件所有产能加成
def calculate_p(yield_group,productivity_group):
    sum_productivity = 0 
    for i in range(len(yield_group)):
        sum_productivity = sum_productivity + yield_group[i]* yield_module[i][0]

    for i in range(len(productivity_group)):
        sum_productivity = sum_productivity + productivity_group[i]* productivity_module[i][0]

    return sum_productivity

## 计算插件所有速度加成
def calculate_s(speed_group,haste_group,yield_group):
    sum_speed = 0 
    for i in range(len(speed_group)):
        sum_speed = sum_speed + speed_group[i]* speed_module[i][1]

    for i in range(len(haste_group)):
        sum_speed = sum_speed + haste_group[i]* haste_module[i][1]

    for i in range(len(yield_group)):
        sum_speed = sum_speed + yield_group[i]* yield_module[i][1]

    return sum_speed

## 计算插件所有效能加成
def calculate_e(speed_group,haste_group,yield_group,productivity_group,efficiency_group):
    sum_efficiency = 0
    for i in range(len(speed_group)):
        sum_efficiency = sum_efficiency + speed_group[i]* speed_module[i][2]

    for i in range(len(haste_group)):
        sum_efficiency = sum_efficiency + haste_group[i]* haste_module[i][2]

    for i in range(len(yield_group)):
        sum_efficiency = sum_efficiency + yield_group[i]* yield_module[i][2]

    for i in range(len(efficiency_group)):
        sum_efficiency = sum_efficiency + efficiency_group[i]* efficiency_module[i][2]

    for i in range(len(productivity_group)):
        sum_efficiency = sum_efficiency + productivity_group[i]* productivity_module[i][2]

    sum_efficiency = max(0.2,sum_efficiency)

    return sum_efficiency


if __name__ == "__main__":
    energy_efficiency = 0
    craft_efficiency = 0

    speed_test = [
        [0,0,0,0],
        [0,0,0,0]
        ]
    haste_test = [
        [0,0,0,0],
        [0,0,0,0]
        ]
    yield_test = [
        [0,0,0,0],
        [0,0,0,0]
        ]
    productivity_test = [
        [0,0,0,0],
        [0,0,0,0]
        ]
    efficiency_test = [
        [0,0,0,0],
        [0,0,0,0]
        ]

    def simulation(speed_test,haste_test,yield_test,productivity_test,efficiency_test):
        speed_sum = calculate_s(speed_test,haste_test,yield_test)
        productivity_sum = calculate_p(yield_test,productivity_test)
        efficiency_sum = calculate_e(speed_test,haste_test,yield_test,productivity_test,efficiency_test)

        ## 加工效率 = 实际产量加成 X 实际速度加成
        craft_efficiency = (1 + productivity_sum) * (1 + speed_sum)
        ## 能量效率 = 加工效率 / 实际能量加成
        energy_efficiency = craft_efficiency / (1 + efficiency_sum)
        ## 实际消耗速度 = 1 + 插件速度加成
        consume_speed = 1 + speed_sum
        ## 实际生产速度 = 实际消耗速度 X （1 + 产能加成）
        production_speed = consume_speed * (1 + productivity_sum)

        print("speed           :",speed_sum,       "\tproductivity     :",productivity_sum,"\tenergy: ",efficiency_sum)
        print("consume speed   :",consume_speed,   "\tproduction speed :",production_speed)
        print("craft_efficiency:",craft_efficiency,"\tenergy_efficiency:",energy_efficiency)

    for n in range(20):
        speed_test[0][2] = n + 12
        speed_test[1][2] = n + 6
        productivity_test[0][2] = 0
        productivity_test[1][2] = 6
        print("n = ", n + 1)

        for i in range(2):
            simulation(speed_test[i],haste_test[i],yield_test[i],productivity_test[i],efficiency_test[i])
            print("\n")
        print("**********************************************")