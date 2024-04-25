class technology_prototype:
    def __init__(self,name,req_time,req_num):
        self.req_time = req_time
        self.req_num = req_num
        self.name = name

    ## 计算需要总时间 = 需要科技包总数 X 单个科技包研究需要时间
    def calc_total_time(self):
        return self.req_time * self.req_num

def calc_research_time(technology_prototype, lab_num, research_modify, speed_modify):
    ## 计算实际研究速度 = （1+ 研究所研究加成) X ( 1 + 所有科研速度加成）
    research_speed = (1 + research_modify) * ( 1 + speed_modify )
    ## 计算实际研究时间 = 科技基础研究总时间 / （ 研究所数量 X 实际研究速度）
    research_actual_time = technology_prototype.calc_total_time()/(lab_num * research_speed)
    packs_per_second = lab_num / (technology_prototype.req_time / research_speed )

    print(technology_prototype.name,"\tspeed: ",research_speed,"\ttime(s): ","%.2f" % research_actual_time, "\ttime(m): ","%.2f" % (research_actual_time/60),"\tpack per second :","%.2f" % packs_per_second)

if __name__ == "__main__":

    lab_num = 100
    research_modify = 0.2
    speed_modify = 0.2

    technology_list = [
        technology_prototype("玻璃制造",30,90),
        technology_prototype("建造机器人",30,100),
        technology_prototype("石灰处理",30,70),
        technology_prototype("混凝土 ",30,150),
        technology_prototype("控制论-6",60,20000)
        ]

    for i in range(len(technology_list)):
        calc_research_time(technology_list[i],lab_num,0.2,0.2)


