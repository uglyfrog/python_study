init_data = {"electric_buffer_size":18000000,"electric_energy":50000,"heat_temperature":250}

def update_engine(e,threshold,ratio,limit,speed):
    storage = e['electric_buffer_size'] - e['electric_energy']
    print("storage : ",storage)
    temp = e['heat_temperature']
    thermal = (temp - threshold) / 2
    print("thermal * ratio : ",thermal * ratio)
    capacity = max(min((thermal * ratio),storage),0)
    print("capacity : ",capacity)
    production = min((capacity / 443.0),limit)
    delta = production * 443.0 / ratio
    heat_temperature = temp - delta
    electric_power_production = production
    print("power_production per s : ",electric_power_production*60)
    print("---------------------")

def update_geothermal():
    e = init_data
    update_engine(e,120,200000,13333.33,0.5)  # 13333.33 * 60 = 0.8M, max_power = 30MW, specific_heat = 4MJ,  power = 10MW, max_temperature = 250C
    update_engine(e,100,360000,41666.67,0.65) # 41666.67 * 60 = 2.5M, max_power = 120MW,specific_heat = 18MJ, power = 30MW, max_temperature = 300C
    update_engine(e,80,800000,133333.33,0.8)  # 133333.33* 60 = 8.0M, max_power = 500MW,specific_heat = 80MJ, power = 80MW, max_temperature = 400C


if __name__ == "__main__":
    update_geothermal()

    


