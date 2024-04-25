# Script by /u/haibane_tenshi

import numpy as np
import matplotlib.pylab as plt
import matplotlib.ticker as mtick
import flow as f

# Creating data for lines of pipes
def pipe_line(d):
	if d>=1:
		result = f.EntityLine()
		
		result.append('pump')
		result.append('pipe',int(d))
		
		return result

data_range = np.arange(1,1000,1)
data = [pipe_line(x) for x in data_range]

x = data_range
y = [line.flow() for line in data]


data_log_range = np.logspace(0,6,1000)
data_log = [pipe_line(x) for x in data_log_range]

x_log = [int(x) for x in data_log_range]
y_log = [line.flow() for line in data_log]

# Normal pipe
plt.figure(1,[11.7,8.27])
lines = plt.plot(x,y)
plt.setp(lines, color='b', linewidth=0.7)

plt.axis([0,1000,0,100])

plt.gca().minorticks_on()
plt.gca().grid(True,'major')
plt.gca().grid(True,'minor',linestyle='dotted')

plt.xlabel('Distance')
plt.ylabel('Flow')

plt.savefig('pipe_line_flow_to_distance.png',bbox_inches='tight')

# Log pipe
plt.gcf().clear()

lines = plt.plot(x_log,y_log)
plt.setp(lines, color='b', linewidth=0.7)
plt.grid(True)
plt.xscale('log')

plt.axis([0,1000000,0,100])

plt.gca().minorticks_on()
plt.gca().grid(True,'major')
plt.gca().grid(True,'minor',linestyle='dotted')

plt.xlabel('Distance')
plt.ylabel('Flow')

plt.savefig('pipe_line_flow_to_distance_log.png',bbox_inches='tight')

# Pipe 1-40
plt.gcf().clear()

lines = plt.plot(x,y)
plt.setp(lines, color='b', linewidth=0.7)
plt.grid(True)

plt.axis([0,40,0,100])

plt.gca().minorticks_on()
plt.gca().grid(True,'major')
plt.gca().grid(True,'minor',linestyle='dotted')

plt.xlabel('Distance')
plt.ylabel('Flow')

plt.savefig('pipe_line_flow_to_distance_1_40.png',bbox_inches='tight')

# Pipe 180-220 around breakpoint
plt.gcf().clear()

lines = plt.plot(x,y)
plt.setp(lines, color='b', linewidth=0.7)
plt.grid(True)

plt.axis([180,220,15,18])

plt.gca().minorticks_on()
plt.gca().grid(True,'major')
plt.gca().grid(True,'minor',linestyle='dotted')

plt.xlabel('Distance')
plt.ylabel('Flow')

plt.savefig('pipe_line_flow_to_distance_180_220.png',bbox_inches='tight')

# Creating data for lines of boilers
def boiler_line(d):
	if d>=1:
		result = f.EntityLine()
		
		result.append('pump')
		result.append('boiler', int(d))
		
		return result

data_range = np.arange(1,1000,1)
data = [boiler_line(x) for x in data_range]

x = data_range
y = [line.flow() for line in data]

data_log_range = np.logspace(0,6,1000)
data_log = [boiler_line(x) for x in data_log_range]

x_log = [int(x) for x in data_log_range]
y_log = [line.flow() for line in data_log]

# Normal boiler
plt.gcf().clear()

lines = plt.plot(x,y)
plt.setp(lines, color='b', linewidth=0.7)

plt.axis([0,1000,0,150])

plt.gca().minorticks_on()
plt.gca().grid(True,'major')
plt.gca().grid(True,'minor',linestyle='dotted')

plt.xlabel('Distance')
plt.ylabel('Flow')

plt.savefig('boiler_line_flow_to_distance.png',bbox_inches='tight')

# Log boiler
plt.gcf().clear()

lines = plt.plot(x_log,y_log)
plt.setp(lines, color='b', linewidth=0.7)
plt.grid(True)
plt.xscale('log')

plt.axis([0,1000000,0,150])

plt.gca().minorticks_on()
plt.gca().grid(True,'major')
plt.gca().grid(True,'minor',linestyle='dotted')

plt.xlabel('Distance')
plt.ylabel('Flow')

plt.savefig('boiler_line_flow_to_distance_log.png',bbox_inches='tight')

# Boiler 1-40
plt.gcf().clear()

lines = plt.plot(x,y)
plt.setp(lines, color='b', linewidth=0.7)
plt.grid(True)

plt.axis([0,40,0,150])

plt.gca().minorticks_on()
plt.gca().grid(True,'major')
plt.gca().grid(True,'minor',linestyle='dotted')

plt.xlabel('Distance')
plt.ylabel('Flow')

plt.savefig('boiler_line_flow_to_distance_1_40.png',bbox_inches='tight')

# Boiler 180-220 around breakpoint
plt.gcf().clear()

lines = plt.plot(x,y)
plt.setp(lines, color='b', linewidth=0.7)
plt.grid(True)

plt.axis([180,220,32,36])

plt.gca().minorticks_on()
plt.gca().grid(True,'major')
plt.gca().grid(True,'minor',linestyle='dotted')

plt.xlabel('Distance')
plt.ylabel('Flow')

plt.savefig('boiler_line_flow_to_distance_180_220.png',bbox_inches='tight')

# Creating data for lines of storage tanks
def tank_line(d):
	if d>=1:
		result = f.EntityLine()
		
		result.append('pump')
		result.append('storage tank', int(d))
		
		return result

data_range = np.arange(1,1000,1)
data = [tank_line(x) for x in data_range]

x = data_range
y = [line.flow() for line in data]

data_log_range = np.logspace(0,6,1000)
data_log = [tank_line(x) for x in data_log_range]

x_log = [int(x) for x in data_log_range]
y_log = [line.flow() for line in data_log]

# Normal storage tank
plt.gcf().clear()

lines = plt.plot(x,y)
plt.setp(lines, color='b', linewidth=0.7)

plt.axis([0,1000,0,200])

plt.gca().minorticks_on()
plt.gca().grid(True,'major')
plt.gca().grid(True,'minor',linestyle='dotted')

plt.xlabel('Distance')
plt.ylabel('Flow')

plt.savefig('storage_tank_flow_to_distance.png',bbox_inches='tight')

# Log storage tank
plt.gcf().clear()

lines = plt.plot(x_log,y_log)
plt.setp(lines, color='b', linewidth=0.7)
plt.grid(True)
plt.xscale('log')

plt.axis([0,1000000,0,200])

plt.gca().minorticks_on()
plt.gca().grid(True,'major')
plt.gca().grid(True,'minor',linestyle='dotted')

plt.xlabel('Distance')
plt.ylabel('Flow')

plt.savefig('storage_tank_flow_to_distance_log.png',bbox_inches='tight')

# Storage tank 1-40
plt.gcf().clear()
lines = plt.plot(x,y)
plt.setp(lines, color='b', linewidth=0.7)

plt.axis([0,40,0,200])

plt.gca().minorticks_on()
plt.gca().grid(True,'major')
plt.gca().grid(True,'minor',linestyle='dotted')

plt.xlabel('Distance')
plt.ylabel('Flow')

plt.savefig('storage_tank_flow_to_distance_1_40.png',bbox_inches='tight')

# Race boiler versus ybdeground pipe
def tile_distance_boiler_line(d):
	if d>=1:
		n = int(d)
		k = n%5
		
		result = f.EntityLine()
		
		result.append('pump')
		
		if k!=0:
			result.append('pipe', k)
		
		result.append('boiler', int(n/5))
		
		return result

def tile_distance_underpipe_line(d):
	if d>=1:
		n = int(d)
		k = n%11
		
		result = f.EntityLine()
		
		result.append('pump')
		
		result.append('pipe', 2*int(n/11))
		
		if k==1:
			result.append('pipe', 1)
		elif k>=2:
			result.append('pipe', 2)
		
		return result

data_range = np.arange(1,10000,1)
data1 = [tile_distance_boiler_line(x)    for x in data_range]
data2 = [tile_distance_underpipe_line(x) for x in data_range]

x = data_range
y1 = [line.flow() for line in data1]
y2 = [line.flow() for line in data2]

# Compare boiler to undeground pipe on same distance
plt.gcf().clear()
lines = plt.plot(x,y1,x,y2)
plt.setp(lines[0], color='b', linewidth=0.7)
plt.setp(lines[1], color='r', linewidth=0.7)

plt.legend(['Steam engine line','Undeground pipe line'])

plt.axis([0,3000,0,100])

plt.gca().minorticks_on()
plt.gca().grid(True,'major')
plt.gca().grid(True,'minor',linestyle='dotted')

plt.xlabel('Distance in tiles')
plt.ylabel('Flow')

plt.savefig('boiler_and_underpipe_comparison_on_tile_distance.png',bbox_inches='tight')

# Compare boiler to undeground pipe on same distance 1-40
plt.gcf().clear()
lines = plt.plot(x,y1,x,y2)
plt.setp(lines[0], color='b', linewidth=0.7)
plt.setp(lines[1], color='r', linewidth=0.7)

plt.legend(['Steam engine line','Undeground pipe line'])

plt.axis([0,40,0,100])

plt.gca().minorticks_on()
plt.gca().grid(True,'major')
plt.gca().grid(True,'minor',linestyle='dotted')

plt.xlabel('Distance in tiles')
plt.ylabel('Flow')

plt.savefig('boiler_and_underpipe_comparison_on_tile_distance_1_40.png',bbox_inches='tight')

# Data on boilers

x3_0 = [x for x in data_range if x%5==0]
x3_1 = [x for x in data_range if x%5==1]
x3_2 = [x for x in data_range if x%5==2]
x3_3 = [x for x in data_range if x%5==3]
x3_4 = [x for x in data_range if x%5==4]

data3_0 = [tile_distance_boiler_line(x) for x in x3_0]
data3_1 = [tile_distance_boiler_line(x) for x in x3_1]
data3_2 = [tile_distance_boiler_line(x) for x in x3_2]
data3_3 = [tile_distance_boiler_line(x) for x in x3_3]
data3_4 = [tile_distance_boiler_line(x) for x in x3_4]

y3_0 = [line.flow() for line in data3_0]
y3_1 = [line.flow() for line in data3_1]
y3_2 = [line.flow() for line in data3_2]
y3_3 = [line.flow() for line in data3_3]
y3_4 = [line.flow() for line in data3_4]

# Boiler line decomposed
plt.gcf().clear()
lines = plt.plot(x3_0,y3_0,x3_1,y3_1,x3_2,y3_2,x3_3,y3_3,x3_4,y3_4)
plt.setp(lines[0], color='red', linewidth=0.7)
plt.setp(lines[1], color='yellow', linewidth=0.7)
plt.setp(lines[2], color='green', linewidth=0.7)
plt.setp(lines[3], color='magenta', linewidth=0.7)
plt.setp(lines[4], color='blue', linewidth=0.7)

plt.legend(['Steam engine line','Steam engine line with 1 pipe','Steam engine line with 2 pipes','Steam engine line with 3 pipes','Steam engine line with 4 pipes'])

plt.axis([0,1100,0,100])

plt.gca().minorticks_on()
plt.gca().grid(True,'major')
plt.gca().grid(True,'minor',linestyle='dotted')

plt.xlabel('Distance in tiles')
plt.ylabel('Flow')

plt.savefig('boiler_and_underpipe_comparison_boiler_decomposed.png',bbox_inches='tight')

def tile_distance_boiler_2_line(d):
	if d>=1:
		n = int(d)
		k = n%5
		
		result = f.EntityLine()
		
		result.append('pump')
		
		if k==1:
			result.append('pipe', 1)
		elif k>1:
			result.append('pipe', 2)
		
		result.append('boiler', int(n/5))
		
		return result

data1 = [tile_distance_boiler_2_line(x) for x in data_range]

y1 = [line.flow() for line in data1]

# Compare boiler2 to undeground pipe on same distance
plt.gcf().clear()
lines = plt.plot(x,y1,x,y2)
plt.setp(lines[0], color='b', linewidth=0.7)
plt.setp(lines[1], color='r', linewidth=0.7)

plt.legend(['Steam engine+ line','Undeground pipe line'])

plt.axis([0,3000,0,100])

plt.gca().minorticks_on()
plt.gca().grid(True,'major')
plt.gca().grid(True,'minor',linestyle='dotted')

plt.xlabel('Distance in tiles')
plt.ylabel('Flow')

plt.savefig('boiler2_and_underpipe_comparison_on_tile_distance.png',bbox_inches='tight')

# Compare boiler to undeground pipe on same distance 1-40
plt.gcf().clear()
lines = plt.plot(x,y1,x,y2)
plt.setp(lines[0], color='b', linewidth=0.7)
plt.setp(lines[1], color='r', linewidth=0.7)

plt.legend(['Steam engine+ line','Undeground pipe line'])

plt.axis([0,40,0,100])

plt.gca().minorticks_on()
plt.gca().grid(True,'major')
plt.gca().grid(True,'minor',linestyle='dotted')

plt.xlabel('Distance in tiles')
plt.ylabel('Flow')

plt.savefig('boiler2_and_underpipe_comparison_on_tile_distance_1_40.png',bbox_inches='tight')

def flow_pipe_mu_nu(d,mu,nu):
	if d>=1:
		result = f.EntityLine()
		
		result.append('pump')
		result.append('pipe', int(d))
		
		result.fluid.mu = mu
		result.fluid.nu = nu
		
		return result

# Creating data for different mu

data_range = np.arange(1,1000,1)
data1 = [flow_pipe_mu_nu(x, 0.35 , 0.59) for x in data_range]
data2 = [flow_pipe_mu_nu(x, 0.4  , 0.59) for x in data_range]
data3 = [flow_pipe_mu_nu(x, 0.405, 0.59) for x in data_range]
data4 = [flow_pipe_mu_nu(x, 0.41 , 0.59) for x in data_range]

x = data_range
y1 = [line.flow() for line in data1]
y2 = [line.flow() for line in data2]
y3 = [line.flow() for line in data3]
y4 = [line.flow() for line in data4]

# Compare pipe lines with different mu
plt.gcf().clear()
lines = plt.plot(x,y1,x,y2,x,y3,x,y4)
plt.setp(lines[0], color='r', linewidth=0.7)
plt.setp(lines[1], color='b', linewidth=0.7)
plt.setp(lines[2], color='g', linewidth=0.7)
plt.setp(lines[3], color='magenta', linewidth=0.7)

plt.legend(['$\mu=0.35$','$\mu=0.4$','$\mu=0.405$','$\mu=0.41$'])

plt.axis([0,1000,0,55])

plt.gca().minorticks_on()
plt.gca().grid(True,'major')
plt.gca().grid(True,'minor',linestyle='dotted')

plt.xlabel('Distance')
plt.ylabel('Flow')

plt.savefig('pipe_line_comparison_on_different_mu.png', bbox_inches='tight')

# Creating data for different nu

data_range = np.arange(1,1000,1)
data1 = [flow_pipe_mu_nu(x, 0.4, 0.58 ) for x in data_range]
data2 = [flow_pipe_mu_nu(x, 0.4, 0.59 ) for x in data_range]
data3 = [flow_pipe_mu_nu(x, 0.4, 0.595) for x in data_range]
data4 = [flow_pipe_mu_nu(x, 0.4, 0.6  ) for x in data_range]

x = data_range
y1 = [line.flow() for line in data1]
y2 = [line.flow() for line in data2]
y3 = [line.flow() for line in data3]
y4 = [line.flow() for line in data4]

# Compare pipe lines with different nu
plt.gcf().clear()
lines = plt.plot(x,y1,x,y2,x,y3,x,y4)
plt.setp(lines[0], color='r', linewidth=0.7)
plt.setp(lines[1], color='b', linewidth=0.7)
plt.setp(lines[2], color='g', linewidth=0.7)
plt.setp(lines[3], color='magenta', linewidth=0.7)

plt.legend(['$\\nu=0.58$','$\\nu=0.59$','$\\nu=0.595$','$\\nu=0.6$'])

plt.axis([0,1000,0,55])

plt.gca().minorticks_on()
plt.gca().grid(True,'major')
plt.gca().grid(True,'minor',linestyle='dotted')

plt.xlabel('Distance')
plt.ylabel('Flow')

plt.savefig('pipe_line_comparison_on_different_nu.png', bbox_inches='tight')

#Creating data for different pairs of mu and nu

data_range = np.arange(1,1000,1)
data1 = [flow_pipe_mu_nu(x, 0.42, 0.57) for x in data_range]
data2 = [flow_pipe_mu_nu(x, 0.41, 0.58) for x in data_range]
data3 = [flow_pipe_mu_nu(x, 0.4 , 0.59) for x in data_range]
data4 = [flow_pipe_mu_nu(x, 0.39, 0.6 ) for x in data_range]
data5 = [flow_pipe_mu_nu(x, 0.38, 0.61) for x in data_range]

x = data_range
y1 = [line.flow() for line in data1]
y2 = [line.flow() for line in data2]
y3 = [line.flow() for line in data3]
y4 = [line.flow() for line in data4]
y5 = [line.flow() for line in data5]

# Compare pipe lines with different mu and nu
plt.gcf().clear()
lines = plt.plot(x,y1,x,y2,x,y3,x,y4,x,y5)
plt.setp(lines[0], color='red', linewidth=0.7)
plt.setp(lines[1], color='cyan', linewidth=0.7)
plt.setp(lines[2], color='green', linewidth=0.7)
plt.setp(lines[3], color='magenta', linewidth=0.7)
plt.setp(lines[4], color='blue', linewidth=0.7)

plt.legend(['$\\mu=0.42$, $\\nu=0.57$',
			'$\\mu=0.41$, $\\nu=0.58$',
			'$\\mu=0.40$, $\\nu=0.59$',
			'$\\mu=0.39$, $\\nu=0.60$',
			'$\\mu=0.38$, $\\nu=0.61$'])

plt.axis([0,1000,0,50])

plt.gca().minorticks_on()
plt.gca().grid(True,'major')
plt.gca().grid(True,'minor',linestyle='dotted')

plt.xlabel('Distance')
plt.ylabel('Flow')

plt.savefig('pipe_line_comparison_on_different_mu_and_nu.png', bbox_inches='tight')

# Compare pipe lines with different mu and nu
plt.gcf().clear()
lines = plt.plot(x,y1,x,y2,x,y3,x,y4,x,y5)
plt.setp(lines[0], color='red', linewidth=0.7)
plt.setp(lines[1], color='cyan', linewidth=0.7)
plt.setp(lines[2], color='green', linewidth=0.7)
plt.setp(lines[3], color='magenta', linewidth=0.7)
plt.setp(lines[4], color='blue', linewidth=0.7)

plt.legend(['$\\mu=0.42$, $\\nu=0.57$',
			'$\\mu=0.41$, $\\nu=0.58$',
			'$\\mu=0.40$, $\\nu=0.59$',
			'$\\mu=0.39$, $\\nu=0.60$',
			'$\\mu=0.38$, $\\nu=0.61$'])

plt.axis([0,250,15,20])

plt.gca().minorticks_on()
plt.gca().grid(True,'major')
plt.gca().grid(True,'minor',linestyle='dotted')

plt.xlabel('Distance')
plt.ylabel('Flow')

plt.savefig('pipe_line_comparison_on_different_mu_and_nu_0_250.png', bbox_inches='tight')


def flow_pipe_1tank_start(d):
	if d >= 3:
		result = f.EntityLine()
		
		result.append('pump')
		result.append('storage tank')
		result.append('pipe', int(d-1))
		
		return result

def flow_pipe_1tank_middle(d):
	if d >= 3:
		result = f.EntityLine()
		
		result.append('pump')
		result.append('pipe',int(d-1))
		result.emplace(int((d+1)/2),'storage tank')
		
		return result

def flow_pipe_1tank_end(d):
	if d >= 3:
		result = f.EntityLine()
		
		result.append('pump')
		result.append('pipe',int(d-1))
		result.append('storage tank')
		
		return result

# Prepare data

data_range = np.arange(3,1000,1)
data1 = [flow_pipe_1tank_start(x)  for x in data_range]
data2 = [flow_pipe_1tank_middle(x) for x in data_range]
data3 = [flow_pipe_1tank_end(x)    for x in data_range]

x = data_range
y1 = [line.flow() for line in data1]
y2 = [line.flow() for line in data2]
y3 = [line.flow() for line in data3]

# Compare pipe lines with different position of storage tank
plt.gcf().clear()
lines = plt.plot(x,y1,x,y2,x,y3)
plt.setp(lines[0], color='r', linewidth=0.7)
plt.setp(lines[1], color='b', linewidth=0.7)
plt.setp(lines[2], color='g', linewidth=0.7)

plt.legend(['Storage tank at the start','Storage tank in the middle','Storage tank at the end'])

plt.axis([0,1000,0,55])

plt.gca().minorticks_on()
plt.gca().grid(True,'major')
plt.gca().grid(True,'minor',linestyle='dotted')

plt.xlabel('Distance')
plt.ylabel('Flow')

plt.savefig('pipe_line_with_1_storage_tank_comparison.png', bbox_inches='tight')

# Compare pipe lines with different position of storage tank 0-50
plt.gcf().clear()
lines = plt.plot(x,y1,x,y2,x,y3)
plt.setp(lines[0], color='r', linewidth=0.7)
plt.setp(lines[1], color='b', linewidth=0.7)
plt.setp(lines[2], color='g', linewidth=0.7)

plt.legend(['Storage tank at the start','Storage tank in the middle','Storage tank at the end'])

plt.axis([0,50,0,55])

plt.gca().minorticks_on()
plt.gca().grid(True,'major')
plt.gca().grid(True,'minor',linestyle='dotted')

plt.xlabel('Distance')
plt.ylabel('Flow')

plt.savefig('pipe_line_with_1_storage_tank_comparison_1_50.png', bbox_inches='tight')

# Compare pipe lines with different position of storage tank 150-200
plt.gcf().clear()
lines = plt.plot(x,y1,x,y2,x,y3)
plt.setp(lines[0], color='r', linewidth=0.7)
plt.setp(lines[1], color='b', linewidth=0.7)
plt.setp(lines[2], color='g', linewidth=0.7)

plt.legend(['Storage tank at the start','Storage tank in the middle','Storage tank at the end'])

plt.axis([150,200,12,20])

plt.gca().minorticks_on()
plt.gca().grid(True,'major')
plt.gca().grid(True,'minor',linestyle='dotted')

plt.xlabel('Distance')
plt.ylabel('Flow')

plt.savefig('pipe_line_with_1_storage_tank_comparison_150_200.png', bbox_inches='tight')

def boiler_line_moving_pipe(d, pos):
	if d >= 1 and 0 <= pos and pos <= d:
		result = f.EntityLine()
		
		result.append('pump')
		result.append('boiler', int(d))
		result.emplace(int(pos)+1,'pipe')
		
		return result

# Prepare data for moving pipe
data_c = 100
data_range = np.arange(0,data_c+1,1)
data = [boiler_line_moving_pipe(data_c, x) for x in data_range]

x = data_range
y = [line.flow() for line in data]

# Plot moving pipe for 100
plt.gcf().clear()
lines = plt.plot(x,y)
plt.setp(lines[0], color='b', linewidth=0.7)

plt.axis([0,data_c,20,40])

plt.gca().minorticks_on()
plt.gca().grid(True,'major')
plt.gca().grid(True,'minor',linestyle='dotted')

plt.xlabel('Pipe position')
plt.ylabel('Flow')

plt.savefig('boiler_line_with_moving_pipe.png', bbox_inches='tight')

def boiler_line_underflow_pipe_index(d):
	if d >= 1:
		for i in range(0,d+1):
			line = boiler_line_moving_pipe(d,i)
			line.flow()
			
			if line.underflow_data.flag:
				return i
		
		return d

data_range = np.arange(1,1000,1)
data = [boiler_line_underflow_pipe_index(x) for x in data_range]

x = data_range
y = data

# Plot index of smallest pipe position when underflow kicks in
plt.gcf().clear()
lines = plt.plot(x,y)
plt.setp(lines[0], color='b', linewidth=0.7)

plt.axis([0,1000,0,500])

plt.gca().minorticks_on()
plt.gca().grid(True,'major')
plt.gca().grid(True,'minor',linestyle='dotted')

plt.xlabel('Distance')
plt.ylabel('Pipe position')

plt.savefig('boiler_line_underflow_pipe_index.png', bbox_inches='tight')
