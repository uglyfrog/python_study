from itertools import repeat

num_ticks_in_one_second = 60

class train_prototype:
    def __init__(self,power, max_speed, weight, friction_force, brake_force, air_resistance):
        # 摩檫力
        self.friction_force = friction_force
        # 重量
        self.weight = weight
        # 功率
        self.power = power
        # 空气阻力
        self.air_resistance = air_resistance
        # 刹车力
        self.brake_force = brake_force
        # 最大速度
        self.max_speed = max_speed

class fuel_prototype:
    def __init__(self,acceleration_modifier,maxspeed_modifier):
        # 燃料加速度修正值
        self.acceleration_modifier = acceleration_modifier
        # 燃料速度修正值
        self.maxspeed_modifier = maxspeed_modifier

class wagon:
    def __init__(self,train_prototype,fuel_prototype):
        self.train_prototype = train_prototype
        self.fuel_prototype = fuel_prototype

class fuel_with_name:
    def __int__(self,name,fuel_prototype):
        self.name = name
        self.fuel_prototype = fuel_prototype

class train:
    wagons = []
    def __init__(self,wagon,num):
        if(num == 1):
            self.wagons = wagon
        else:
            for i in range(num):
                self.wagons.append(wagon) 
        
    ## 计算空气阻力总值
    def airResisitance(self):
        return self.wagons[0].train_prototype.air_resistance

    ## 计算车辆总功率（注：只有火车头才有功率）
    def power(self):
        sum_power = 0
        for i in range(len(self.wagons)):
            sum_power = sum_power + self.wagons[i].train_prototype.power * self.wagons[i].fuel_prototype.acceleration_modifier
        return sum_power

    ## 计算车辆重量总值
    def weight(self):
        sum_weight = 0
        for i in range(len(self.wagons)):
            sum_weight = sum_weight + self.wagons[i].train_prototype.weight
        return sum_weight

    ## 计算刹车动力总值
    def brakingForce(self):
        sum_brakingForce = 0
        for i in range(len(self.wagons)):
            sum_brakingForce = sum_brakingForce + self.wagons[i].train_prototype.brake_force
        return sum_brakingForce

    ## 计算摩檫力总值
    def friction(self):
        sum_friction = 0
        for i in range(len(self.wagons)):
            sum_friction = sum_friction + self.wagons[i].train_prototype.friction_force
        return sum_friction

    ## 计算理论最大速度
    def theoreticalMaxSpeed(self):
        max_speed = 999999
        speed_modifier = 0
        train_num = 0

        for i in range(len(self.wagons)):
            max_speed = min(max_speed,self.wagons[i].train_prototype.max_speed)
            if (self.wagons[i].train_prototype.power > 0):
                speed_modifier = speed_modifier + self.wagons[i].fuel_prototype.maxspeed_modifier
                train_num = train_num + 1
        return max_speed * (speed_modifier / train_num)

    ## 模拟加速过程，计算最终速度和加速时间
    def simulateAcceleration(self):
        eps = 0.00001
        total_weight = self.weight()
        total_air_resistance = self.airResisitance()
        total_power = self.power() / num_ticks_in_one_second
        total_friction = self.friction()
        max_speed = self.theoreticalMaxSpeed()
        current_speed = 0
        tick1 = 0

        for _ in repeat(None):
            next_speed = current_speed
            next_speed = next_speed - min(current_speed,total_friction / total_weight)
            next_speed = next_speed + total_power / total_weight / 1000
            next_speed = next_speed * (1 - total_air_resistance / (total_weight / 1000))
            next_speed = min(next_speed, max_speed)

            tick1 = tick1 + 1
            if ( abs(current_speed - next_speed) < eps ):
                break
            current_speed = next_speed
            

        return current_speed,tick1

    ## 模拟刹车过程，计算刹车消耗时间
    def simulateBraking(self,brakingForceBonus):
        total_weight = self.weight()
        total_braking_force = self.brakingForce() * ( 1 + brakingForceBonus)
        current_speed, ticks = self.simulateAcceleration()
        tick2 = 0

        for _ in repeat(None):
            next_speed = current_speed
            next_speed = next_speed - total_braking_force / total_weight

            tick2 = tick2 + 1
            if (next_speed < 0):
                break;
            current_speed = next_speed
               
            
        return tick2


if __name__ == "__main__":
    ##(功率， 最大速度， 重量， 摩檫力， 刹车力， 空气阻力)
    ##(power, max_speed, weight, friction_force, brake_force, air_resistance)
    locomotive_prototype = train_prototype(600*1000, 1.2, 2000, 0.5, 10, 0.0075)
    cargo_wagon_prototype = train_prototype(0, 1.5, 1000, 0.5, 3.0, 0.01)

    locomotive_num = 10
    cargo_num = 100
    braking_force_bonus = 1

    ##(加速度修正值，最大速度修正值)
    ##(acceleration_modifier,maxspeed_modifier)
    wood_prototype = fuel_prototype(1,1)
    coal_prototype = fuel_prototype(1,1)
    solid_prototype = fuel_prototype(1.2,1.05)
    rocket_prototype = fuel_prototype(1.8,1.15)
    nuclear_prototype = fuel_prototype(2.5,1.15)

    fuel_list = [wood_prototype,coal_prototype,solid_prototype,rocket_prototype,nuclear_prototype]
    fuel_name = ["wood","coal","solid","rocket","nuclear"]

    train_list = []
    all_pack = []

    for i in range(len(fuel_list)):
        all_pack = []
        for j in range(1,locomotive_num+1):
            locomotives = wagon(locomotive_prototype, fuel_list[i])
            all_pack.append(locomotives)
            for k in range(cargo_num):   
                cargos = wagon(cargo_wagon_prototype, fuel_list[i])
                
                if (k > 0):
                    all_pack.append(cargos)

                trains = train(all_pack, 1)
                speeds,ticks_acceleration = trains.simulateAcceleration()
                ticks_braking = trains.simulateBraking(braking_force_bonus)
                print("Loco: ",j,"\tcargos:",k,"\t",fuel_name[i],"\t","speed: ","%.3f" % (speeds*num_ticks_in_one_second*3.6),"\t","acc time: ","%.3f" % (ticks_acceleration / num_ticks_in_one_second),"\t","acc","%.3f" % (speeds*num_ticks_in_one_second/(ticks_acceleration/num_ticks_in_one_second)),"\t","braking: ","%.3f" % (ticks_braking / num_ticks_in_one_second),"\t","train nums: ",len(all_pack),"\n")

            all_pack = all_pack[:j]     