
import matplotlib.pyplot as plt #绘图用的模块  
from mpl_toolkits.mplot3d import Axes3D #绘制3D坐标的函数  
import numpy as np  

plt.figure(num=1,dpi=100,facecolor='#D3D3D3',edgecolor='r',figsize=(12,9))

#设置最大迭代次数
maxIter=5000

#设置维度和变化率
lenX=lenY=10
delta=1

#边界条件
Ttop=100
Tbottom=0
Tright=0
Tleft=0

#内部网格的猜测温度
Tguess=30

#设置格点

colorinterpolation=50
X,Y=np.meshgrid(np.arange(0,lenX),np.arange(0,lenY))

#设置数组尺寸以及内部温度Tguess
T=np.empty((lenX,lenY))
T.fill(Tguess)

#设置边界条件
T[(lenY-1):,:]=Ttop
T[:1,:]=Tbottom
T[:,(lenX-1):]=Tright
T[:,:1]=Tleft
  

#迭代循环
print('Please wait for a time')
for iteration in range(0,maxIter):
    for i in range(1,lenX-1,delta):
        for j in range(1,lenY-1,delta):
            T[i,j]=0.25*(T[i+1][j]+T[i-i][j]+T[i][j+1]+T[i][j+1])
            
            
print('Iteration finished')

plt.title('热传导')
plt.contourf(X,Y,T,colorinterpolation,cmap='hot')
plt.colorbar()


plt.show()