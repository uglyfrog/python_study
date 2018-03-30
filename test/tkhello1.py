import Tkinter

top = Tkinter.Tk()
top.geometry('640x480')

label = Tkinter.Label(top,text='Hello World')
label.pack()

quit = Tkinter.Button(top,text='Test',command = top.quit)
quit.pack(fill=Tkinter.X,expand=1)

Tkinte
r.mainloop()

