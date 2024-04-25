
import matplotlib.pyplot as plt #绘图用的模块  
from mpl_toolkits.mplot3d import Axes3D #绘制3D坐标的函数  
import numpy as np  

fig = plt.figure()
ax = Axes3D(fig)

#设置最大迭代次数
maxIter=1000


#设置维度和变化率
lenX=lenY=lenZ=10
delta=1

#边界条件
Ttop=500
Tbottom=0
Tright=100
Tleft=0
Tfront=300
Tbehind=0
#内部网格的猜测温度
Tguess=30

#设置格点

colorinterpolation=50
X,Y,Z=np.meshgrid(np.arange(0,lenX),np.arange(0,lenY),np.arange(0,lenZ))

#设置数组尺寸以及内部温度Tguess
T=np.empty((lenX,lenY,lenZ))
T.fill(Tguess)

#设置边界条件
T[(lenY-1):,:,:]=Ttop
T[:1,:,:]=Tbottom
T[:,(lenX-1):,:]=Tright
T[:,:1,:]=Tleft
T[:,:,:1]=Tfront
T[:,:,-2:]=Tbehind  

#迭代循环
print('Please wait for a time')
for iteration in range(0,maxIter):
    
    for i in range(1,lenX-1,delta):
        for j in range(1,lenY-1,delta):
            for k in range(1,lenZ-1,delta):
                T[i,j]=1/6*(T[i+1][j][k]+T[i-i][j][k]+T[i][j+1][k]+T[i][j-1][k]+T[i][j][k+1]+T[i][j][k-1])