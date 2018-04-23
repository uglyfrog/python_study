from tkinter import *
# from tkinter.ttk import *
from PIL import ImageTk
import random
from tkinter.messagebox import *
import os

# img = Image.open(filePath)

# img = ImageTk.PhotoImage(img)




root = Tk()
root.title("战斗模拟器")
root.geometry("300x500+100+100")
# 去除边框
root.overrideredirect(0)
# root.iconbitmap("submarine.ico")

# cv = Canvas(root,bg = 'blue',width = 150,height = 150)  
# cv.grid(row=0,column=0)

# f1 = Frame(root,width=100,height=100,bg='blue',borderwidth=2)
# f1.grid(row=1, column=0)

cv = Canvas(root,bg = 'black',width = 100,height = 100)    
# 创建一个items,坐标为(10,10,110,110)，并填充颜色为红色,边框黄色，宽度为3,使用点阵，矩形用网格
ta = cv.create_rectangle(10,10,50,50,fill = 'red',outline = 'yellow',width = 3,dash = 3,stipple = 'gray12', tags = 'r1')
# cv.itemconfig(ta, tags = ('r2','r3','r4','r5'))  
# print(cv.gettags(ta))
cv.place(x=100,y=0)

# example of image added in label
# logo = ImageTk.PhotoImage(file="d:/python_test/xiyou.png")
label_logo = Label(root, justify=RIGHT, padx=0, pady=0).place(x=100, y=160)
label_title = Label(root, justify=RIGHT, text="完全模拟MMORPG战斗", padx =5, font = "Verdana 10 bold", fg="light yellow", bg="dark green",)
label_title.place(x=80,y=110)

# example of entry
user_name = Label(root,text='用户名').place(x=50,y=260)
user_password = Label(root,text='密码').place(x=50,y=300)
var_user_name = StringVar()
entry_user_name = Entry(root,textvariable=var_user_name).place(x=100,y=260)
var_user_password = StringVar()
entry_user_password = Entry(root,textvariable=var_user_password,show='*').place(x=100,y=300)



# listbox1 = Listbox(root)
# listbox2 = Listbox(root)
# li1     = ['C','python','php','html','SQL','java']
# li2     = ['任楚飞','任东','汤斯典','汤晓白','猫']
# for item in li1:                 # 第一个小部件插入数据
#     listbox1.insert(5,item)
# for item in li2:                 # 第一个小部件插入数据
#     listbox2.insert(5,item)

# listbox1.pack()
# listbox2.pack()

# example of button and random color of canvas
color_type = ["red","yellow","green","blue"]

def quit_menu():
	showinfo(title = "quit window", message = "see you later")
	root.quit()

def sign_up():
	# example of canvas
	cvbg = random.choice(color_type)
	cv = Canvas(root,bg = cvbg ,width = 100,height = 100)    
	ta = cv.create_rectangle(10,10,50,50,fill = 'red',outline = 'yellow',width = 3,dash = 3,stipple = 'gray12', tags = 'r1')
	cv.grid(row=3,column=1)
	#打印密码
	npf = var_user_password.get()
	print(npf)

quitButton = Button(root, text='退出', relief=RAISED, command=quit_menu, bd = 5, padx=15,pady = 10, bg="red").place(x=200,y=360)
signButton = Button(root, text='登录',relief=RAISED, command=sign_up, bd = 3, padx=15,pady = 10, bg="green").place(x=120,y=360)
disableButton = Button(root, text='禁止',relief=RAISED, bd = 3, state = "disabled", padx=15,pady = 10, bg="blue").place(x=40,y=360)


# example of auto counter
counter = 0   
def counter_label(label):  
	global counter  
	counter += 1  
	label.config(text="倒计时："+str(counter), font = "Helvetica 10 bold italic")  
	label.after(1000, counter_label, label)  

label_count = Label(root, fg="green")  
label_count.place(x=140,y=140)
counter_label(label_count) 

# example of menu
menu_bar = Menu(root)

def tool_des():
	# example of top window
	top_window = Toplevel(root)
	top_window.title("说明")
	top_window.geometry("140x50+175+300")
	# top_window.iconbitmap("support.ico")
	cv = Canvas(top_window,bg = "black" ,width = 140,height = 50).grid(row=2,column=2)
	top_window_label = Label(top_window, text = "这是一个工具演示！",bg = "white")
	top_window_label.grid(row=2, column=2)

# def open_file():
# 	global filename
# 	filename = askopenfilename(defaultextension = ".txt")
# 	if filename == "":
# 		filename == None
# 	else:
# 		root.title("打开文件"+os.path.basename(filename))
# 		textPad.delete(1, END)
# 		f = open(filename, "r")
# 		textPad.insert(1.0, f.read())
# 		f.close

submenu_hero = Menu(menu_bar)
for item in ["职业","属性","技能"]:
	submenu_hero.add_command(label = item)

submenu_monster = Menu(menu_bar)
for item in ["普通怪","首领","属性","技能"]:
	submenu_monster.add_command(label = item)

submenu_card = Menu(menu_bar)
for item in ["战斗","技能","天赋","特殊"]:
	submenu_card.add_command(label = item)

submenu_trait = Menu(menu_bar)
for item in ["战斗","地图","其他"]:
	submenu_trait.add_command(label = item)
	submenu_trait.add_separator()

# add "帮助"menu click action
submenu_help = Menu(menu_bar)
submenu_help.add_command(label = "关于", command = tool_des)
submenu_help.add_command(label = "打开")

menu_bar.add_cascade(label = "英雄", menu = submenu_hero)
menu_bar.add_cascade(label = "怪物", menu = submenu_monster)
menu_bar.add_cascade(label = "卡牌", menu = submenu_card)
menu_bar.add_cascade(label = "性格", menu = submenu_trait)
menu_bar.add_cascade(label = "帮助", menu = submenu_help)

root["menu"] = menu_bar

filename = ""





root.mainloop()