import random
import tkinter
import tkinter.messagebox

restaurant = [
    "1-四季京味烤鸭店",
    "2-七寸飝大饭店",
    "3-Mezomd曼索蒂西班牙餐厅",
    "4-飞尝蚝",
    "5-老刘生态大鱼坊铁锅炖鱼"
]

tkinter.messagebox.showinfo('恭喜获奖饭店',random.choice(restaurant))



