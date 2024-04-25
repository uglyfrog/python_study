# Script by /u/haibane_tenshi

import copy
import numpy as np

# Helper functions

def first(array):
	return array[0]

def last(array):
	return array[len(array)-1]

# Entity types
G1 = {'pump'}
G2 = {'pipe','pipe to ground'}
G3 = {'boiler','steam engine','steam turbine','heat exchabger','mining drill'}
G4 = {'storage tank'}
G5 = {'assembler','oil refinery','chemical plant','pumpjack'}

# Inherent values for all entity types
def group(entity_name):
	assert isinstance(entity_name,str)

	if   entity_name in G1:
		return 1
	elif entity_name in G2:
		return 2
	elif entity_name in G3:
		return 3
	elif entity_name in G4:
		return 4
	elif entity_name in G5:
		assert False, 'Entities from group 5 are not supported'
	
	assert False, 'Entity \'' + entity_name + '\' is not defined in any group'

def max_pressure(entity_name):
	group_num = group(entity_name)
	
	if   group_num==1:
		return 200
	elif group_num==2:
		return 100
	elif group_num==3:
		return 100
	elif group_num==4:
		return 100

def min_pressure(entity_name):
	group_num = group(entity_name)
	
	if   group_num==1:
		return 0
	elif group_num==2:
		return 0
	elif group_num==3:
		return -100
	elif group_num==4:
		return 0

def capacity(entity_name):
	group_num = group(entity_name)
	
	if   group_num==1:
		return 200
	elif group_num==2:
		return 100
	elif group_num==3:
		return 200
	elif group_num==4:
		return 25000

def alpha(entity_name):
	return (max_pressure(entity_name) - min_pressure(entity_name))/capacity(entity_name)
	
class Fluid:
	mu = 0
	nu = 0
	
	def __init__(self, mu = 0.4, nu = 0.59):
		self.mu = mu
		self.nu = nu

default_fluid = Fluid()

class Entity:
	"""
	Class describing entities.
	No support for G5.
	"""
	name = ''
	
	def __init__(self, name = ''):
		assert isinstance(name,str)
		self.name = copy.deepcopy(name)
	
	def __eq__(self, other):
		if self.name == other.name:
			return True
		
		return False
	
	def max_pressure(self):
		return max_pressure(self.name)
	
	def min_pressure(self):
		return min_pressure(self.name)
	
	def capacity(self):
		return capacity(self.name)
	
	def alpha(self):
		return (self.max_pressure() - self.min_pressure())/self.capacity()
	
	def group(self):
		return group(self.name)
	
	def in_group(self, group):
		if isinstance(group,int):
			return self.group() == group
		
		if isinstance(group, set):
			return self.name in group

def of_left_break_pressure_in_A(flow_to_right, entity_A, entity_B, fluid):
	return entity_B.max_pressure()+(flow_to_right - min([fluid.nu*flow_to_right, entity_B.capacity()/10]))/fluid.mu - entity_B.alpha()*flow_to_right

def uf_right_break_pressure_in_B(flow_to_left, entity_A, entity_B, fluid):
	return entity_A.min_pressure()-(flow_to_left - min([fluid.nu*flow_to_left,entity_B.capacity()/10]))/fluid.mu + entity_A.alpha()*flow_to_left

class EntityPack:
	entity = Entity()
	count = 0
	
	def __init__(self, entity, count):
		assert isinstance(entity, Entity)
		assert count >=1
		
		self.entity = copy.deepcopy(entity)
		self.count = copy.deepcopy(count)
	
	def __str__(self):
		return str(self.entity.name) + ' ' + str(self.count)

class EntityArray:
	entity_array = []
	
	def __init__(self, array = []):
		for iter in array:
			assert isinstance(iter, EntityPack)
		
		self.entity_array = copy.deepcopy(array)
	
	def __str__(self):
		result = '['
		
		for i in range(len(self.entity_array)):
			result += str(self.entity_array[i])
			
			if i != len(self.entity_array)-1:
				result += ', '
		
		result += ']'
		return result
	
	def length(self):
		result = 0
		for iter in self.entity_array:
			result += iter.count
		
		return result
	
	def count_name_entries(self, name):
		entity = Entity(name)
		
		result = 0
		for iter in self.entity_array:
			if iter.entity == entity:
				result += iter.count
		
		return result
	
	def count_group_entries(self, group):
		result = 0
		
		for name in group:
			result += self.count_name_entries(name)
		
		return result
	
	def emplace(self, place, entity, count = 1):
		"""
		Emplaces a number of entities into specified spot.
			place - integer, must be within [0, length()]
			entity - can be either string, Entity or EntityPack.
			count - integer, must be positive. Ignored, when 'entity' is EntityPack
		"""
		assert 0 <= place and place <= self.length()
		assert count >= 0
		
		if count == 0:
			return
		
		# Determine 'true' entity and count
		if isinstance(entity, Entity):
			true_entity = entity
			true_count = count
		elif isinstance(entity, EntityPack):
			true_entity = entity.entity
			true_count = entity.count
		elif isinstance(entity, str):
			true_entity = Entity(entity)
			true_count = count
		else:
			assert False, 'Input must be either string, Entity or EntityPack'
		
		# When array is empty just put it in
		if len(self.entity_array) == 0:
			self.entity_array.append(EntityPack(true_entity,true_count))
			return
		
		# Find a spot
		index = len(self.entity_array)-1
		total_count = 0
		for i in range(len(self.entity_array)):
			total_count += self.entity_array[i].count
			
			if total_count >= place:
				index = i
				break
		
		
		if self.entity_array[index].entity == true_entity:
			# When it's the same entity, it's simple
			
			self.entity_array[index].count += true_count
			return
		else:
			# When not, split the pack
			
			right_count = total_count - place
			left_count = self.entity_array[index].count - right_count
			index_entity = self.entity_array[index].entity
			
			del self.entity_array[index]
			
			# Insert left/right shard only when they are not 0 length
			if left_count > 0:
				self.entity_array.insert(index, EntityPack(index_entity, left_count))
				index += 1
			
			self.entity_array.insert(index, EntityPack(true_entity, true_count))
			index += 1
			
			if right_count > 0:
				self.entity_array.insert(index, EntityPack(index_entity, right_count))
	
	def append(self, entity, count = 1):
		"""
		Emplaces specified entity at the end of line. Passes inputs to emplace().
		"""
		self.emplace(self.length(), entity, count)
	
	def prepend(self, entity, count = 1):
		"""
		Emplaces specified entity at the start of line. Passes inputs to emplace().
		"""
		self.emplace(0, entity, count)

class EntitySubline(EntityArray):
	"""
	Class for direct calculation of flow.
	"""
	fluid = Fluid()
	
	pressure_start = 0
	pressure_start_tag = ''
	
	pressure_end = 0
	pressure_end_tag = ''
	
	def __init__(self, array = [], fluid = default_fluid):
		super().__init__(array)
		
		assert isinstance(fluid, Fluid)
		self.fluid = copy.deepcopy(fluid)
	
	def __str__(self):
		return super().__str__()
	
	def flow(self):
		"""
		Calculate maximum throughput flow
		IMPORTANT: No validity checks performed! 
		"""
		# In case there is only one entity, usual formulas doesn't work
		if self.length() < 2:
			return (self.pressure_start - self.pressure_end)/first(self.entity_array).entity.alpha()
		
		# Normal case
		# Count entities
		k1 = self.count_group_entries(G1)
		k2 = self.count_group_entries(G2)
		k3 = self.count_group_entries(G3)
		k4 = self.count_group_entries(G4)
		
		d = self.length()
		
		# Check everything is correct
		assert k1 + k2 + k3 + k4 == d, 'There is alien object in line, which don\'t belong to either group'
		
		# Define alphas
		alpha1 = alpha(min(G1))
		alpha2 = alpha(min(G2))
		alpha3 = alpha(min(G3))
		alpha4 = alpha(min(G4))
		
		# Account for alphas of first and last entity. Required for correct calculation of overflow/underflow
		if self.pressure_start_tag == 'left':
			p_start_coef = -1
		elif self.pressure_start_tag == 'right':
			p_start_coef = 0
		
		if self.pressure_end_tag == 'left':
			p_end_coef = 0
		elif self.pressure_end_tag == 'right':
			p_end_coef = -1
		
		# Calculate sum of alphas, it stays constant
		alpha_sum = k1*alpha1 + k2*alpha2 + k3*alpha3 + k4*alpha4 + \
					p_start_coef*first(self.entity_array).entity.alpha() + p_end_coef*last(self.entity_array).entity.alpha()
		# Define C's
		c_dict = dict({})
		if k1 > 0:
			c1 = capacity(min(G1))
			if c1 in c_dict:
				c_dict[c1] += k1
			else:
				c_dict[c1] = k1
		
		if k2 > 0:
			c2 = capacity(min(G2))
			if c2 in c_dict:
				c_dict[c2] += k2
			else:
				c_dict[c2] = k2
		
		if k3 > 0:
			c3 = capacity(min(G3))
			if c3 in c_dict:
				c_dict[c3] += k3
			else:
				c_dict[c3] = k3
		
		if k4 > 0:
			c4 = capacity(min(G4))
			if c4 in c_dict:
				c_dict[c4] += k4
			else:
				c_dict[c4] = k4
		
		c_first = first(self.entity_array).entity.capacity()
		if c_dict[c_first] > 0:
			c_dict[c_first] -= 1
		else:
			c_dict.pop(c_first)
		
		# Get sorted list of keys
		c_list = sorted(c_dict)
		
		# Define C sums
		top_c_sum = 0
		
		bottom_c_sum = 0
		for c in c_list:
			bottom_c_sum += c_dict[c]
		
		ps = self.pressure_start
		pe = self.pressure_end
		
		mu = self.fluid.mu
		nu = self.fluid.nu
		
		# Now iterate.
		for i in range(len(c_list)+1):
			f = (ps - pe + top_c_sum/(10*mu)) / ((d-1)/mu - bottom_c_sum*nu/mu - alpha_sum)
			
			# Check boundaries
			pass_mark = True
			if i != 0:
				if not c_list[i-1]/(10*nu) <= f:
					pass_mark = False
			
			if i != len(c_list):
				if not f <= c_list[i]/(10*nu):
					pass_mark = False
			
			# When OK we found it
			if pass_mark:
				return f
			
			# When not OK, prepare next iteration
			# When condition is true, it was the last iteration, break here
			if i == len(c_list):
				break
			
			# Otherwise adjust c_sums
			top_c_sum += c_list[i]*c_dict[c_list[i]]
			bottom_c_sum -= c_dict[c_list[i]]

class OverflowAgent:
	flag = False
	left_break_pressure_in_A = 0
	left_flow = 0
	
	def __str__(self):
		result = 'Overflow detected: ' + str(self.flag)
		
		if self.flag:
			result += '\nBreak left pressure in A: ' + str(self.left_break_pressure_in_A)
			result += '\nLeft flow: ' + str(self.left_flow)
			
		return result

class UnderflowAgent:
	flag = False
	right_break_pressure_in_B = 0
	right_flow = 0
	
	def __str__(self):
		result = 'Underflow detected: ' + str(self.flag)
		
		if self.flag:
			result += '\nBreak right pressure in B: ' + str(self.right_break_pressure_in_B)
			result += '\nRight flow: ' + str(self.right_flow)
			
		return result
	

class AtomicEntityLine(EntityArray):
	"""
	Class describing atomic line, i. e. which describe only one independent fluid network.
	"""
	fluid = Fluid()
	
	# Will contain stuff after self.flow() is called, in case over/underflow happens.
	overflow_data = OverflowAgent()
	underflow_data = UnderflowAgent()
	
	def __init__(self, array = [], fluid = default_fluid):
		super().__init__(array)
		
		assert isinstance(fluid, Fluid)
		self.fluid = copy.deepcopy(fluid)
		
		overflow_data = OverflowAgent()
		underflow_data = UnderflowAgent()
	
	def __str__(self):
		return super().__str__()
	
	def flow(self):
		"""
		Calculate maximum throughput flow
		IMPORTANT: No validity checks performed!
		
		Will write over/underflow_data when condition happens.
		"""
		# When length is 1 nothing peculiar can happen, just calculate it
		if len(self.entity_array) == 1:
			subline = EntitySubline(self.entity_array,self.fluid)
			
			subline.pressure_start = first(self.entity_array).entity.max_pressure()
			subline.pressure_start_tag = 'left'
			
			subline.pressure_end = last(self.entity_array).entity.min_pressure()
			subline.pressure_end_tag = 'right'
			
			return subline.flow()
			
		# Otherwise, first, need to detect possible overflow and underflow
		
		self.overflow_data = OverflowAgent()
		self.underflow_data = UnderflowAgent()
		
		# Overflow can happen only when pump is first entity
		if self.entity_array[0].entity.in_group(G1):
			possible_overflow = True
			of_entity_A = self.entity_array[0].entity
			of_entity_B = self.entity_array[1].entity
			of_index = 1
		else:
			possible_overflow = False
			
		# Look for possible underflow
		possible_underflow = False
		
		for i in range(len(self.entity_array)-1,0,-1):
			# Cannot happen further to the left when there is jump in min pressure from -100 to 0
			if self.entity_array[i-1].entity.min_pressure() < self.entity_array[i].entity.min_pressure():
				break
			
			if self.entity_array[i-1].entity.min_pressure() > self.entity_array[i].entity.min_pressure():
				possible_underflow = True
				uf_entity_A = self.entity_array[i-1].entity
				uf_entity_B = self.entity_array[i].entity
				uf_index = i
				
				break
		
		if possible_overflow and possible_underflow:
			if of_index != uf_index:
				# Define central patch
				central_subline = EntitySubline(self.entity_array[of_index:uf_index],self.fluid)
				
				central_subline.pressure_start = first(central_subline.entity_array).entity.max_pressure()
				central_subline.pressure_start_tag = 'left'
				
				central_subline.pressure_end = last(central_subline.entity_array).entity.min_pressure()
				central_subline.pressure_end_tag = 'right'
				
				central_flow = central_subline.flow()
				
				# Define left patch
				
				left_subline = EntitySubline(self.entity_array[:of_index],self.fluid)
				
				left_subline.pressure_start = first(left_subline.entity_array).entity.max_pressure()
				left_subline.pressure_start_tag = 'left'
				
				left_subline.pressure_end = of_left_break_pressure_in_A(central_flow, of_entity_A, of_entity_B, self.fluid)
				left_subline.pressure_end_tag = 'left'
				
				left_flow = left_subline.flow()
				
				# Define right patch
				
				right_subline = EntitySubline(self.entity_array[uf_index:],self.fluid)
				
				right_subline.pressure_start = uf_right_break_pressure_in_B(central_flow, uf_entity_A, uf_entity_B, self.fluid)
				right_subline.pressure_start_tag = 'right'
				
				right_subline.pressure_end = last(right_subline.entity_array).entity.min_pressure()
				right_subline.pressure_end_tag = 'right'
				
				right_flow = right_subline.flow()
				
				# Check conditions for the case
				if left_flow >= central_flow and central_flow <= right_flow:
					# Filling additional data
					self.overflow_data.flag = True
					self.overflow_data.left_break_pressure_in_A = left_subline.pressure_end
					self.overflow_data.left_flow = left_flow
					
					self.underflow_data.flag = True
					self.underflow_data.right_break_pressure_in_B = right_subline.pressure_start
					self.underflow_data.right_flow = right_flow
					
					return central_flow
			#else:
				# Never happens, so do nothing
				#pass
		
		if possible_overflow:
			# Define central patch
			central_subline = EntitySubline(self.entity_array[of_index:],self.fluid)
			
			central_subline.pressure_start = first(central_subline.entity_array).entity.max_pressure()
			central_subline.pressure_start_tag = 'left'
			
			central_subline.pressure_end = last(central_subline.entity_array).entity.min_pressure()
			central_subline.pressure_end_tag = 'right'
			
			central_flow = central_subline.flow()
			
			# Define left patch
			
			left_subline = EntitySubline(self.entity_array[:of_index],self.fluid)
			
			left_subline.pressure_start = first(left_subline.entity_array).entity.max_pressure()
			left_subline.pressure_start_tag = 'left'
			
			left_subline.pressure_end = of_left_break_pressure_in_A(central_flow, of_entity_A, of_entity_B, self.fluid)
			left_subline.pressure_end_tag = 'left'
			
			left_flow = left_subline.flow()
			
			# Check case conditions
			if left_flow >= central_flow:
				# Filling additional data
				self.overflow_data.flag = True
				self.overflow_data.left_break_pressure_in_A = left_subline.pressure_end
				self.overflow_data.left_flow = left_flow
				
				return central_flow
		
		if possible_underflow:
			# Define central patch
			central_subline = EntitySubline(self.entity_array[:uf_index],self.fluid)
			
			central_subline.pressure_start = first(central_subline.entity_array).entity.max_pressure()
			central_subline.pressure_start_tag = 'left'
			
			central_subline.pressure_end = last(central_subline.entity_array).entity.min_pressure()
			central_subline.pressure_end_tag = 'right'
			
			central_flow = central_subline.flow()
			
			# Define right patch
			
			right_subline = EntitySubline(self.entity_array[uf_index:],self.fluid)
			
			right_subline.pressure_start = uf_right_break_pressure_in_B(central_flow, uf_entity_A, uf_entity_B, self.fluid)
			right_subline.pressure_start_tag = 'right'
			
			right_subline.pressure_end = last(right_subline.entity_array).entity.min_pressure()
			right_subline.pressure_end_tag = 'right'
			
			right_flow = right_subline.flow()
			
			# Check case conditions
			if central_flow <= right_flow:
				# Filling additional data
				self.underflow_data.flag = True
				self.underflow_data.right_break_pressure_in_B = right_subline.pressure_start
				self.underflow_data.right_flow = right_flow
				
				return central_flow
		
		# Neither condition met, just calculate
		subline = EntitySubline(self.entity_array,self.fluid)
			
		subline.pressure_start = first(self.entity_array).entity.max_pressure()
		subline.pressure_start_tag = 'left'
		
		subline.pressure_end = last(self.entity_array).entity.min_pressure()
		subline.pressure_end_tag = 'right'
		
		return subline.flow()

class EntityLine(EntityArray):
	"""
	Class describing entity line.
	"""
	fluid = Fluid()
	
	overflow_data = OverflowAgent()
	underflow_data = UnderflowAgent()
	
	def __init__(self, array = [], fluid = default_fluid):
		super().__init__(array)
		
		assert isinstance(fluid, Fluid)
		self.fluid = copy.deepcopy(fluid)
		
		overflow_data = OverflowAgent()
		underflow_data = UnderflowAgent()
	
	def __str__(self):
		return super().__str__()
	
	def length(self):
		result = 0
		for iter in self.entity_array:
			result += iter.count
		
		return result
	
	def flow(self):
		"""
		Calculate maximum throughput flow.
		Splits line into atomic lines and takes minimum over values.
		IMPORTANT: No validity checks performed!
		
		Over/underflow_data will contain copy from minimum case calculations.
		"""
		atomic_lines = []
		
		for i in range(len(self.entity_array)):
			# First entity counts as start of atomic line, regardless of whether it's pump or not
			if i == 0:
				last_pump = 0
				
				# When the first pack is pumps, leave only one, otherwise preserve the pack
				# Fiddling required to prevent multiple pumps from ruining AtomicEntityLine's as each will create a separate line when count>1
				if self.entity_array[0].entity.in_group(G1):
					last_pump_pack = EntityPack(self.entity_array[0].entity,1)
					
					# When there is many pumps put together just add one singular line for completion
					if self.entity_array[0].count > 1:
						atomic_lines.append(AtomicEntityLine([EntityPack(self.entity_array[0].entity,1)],self.fluid))
				else:
					last_pump_pack = self.entity_array[0]
			
			# When we find another pump somewhere in the middle, form another atomic line
			if self.entity_array[i].entity.in_group(G1) and i!=0:
				atomic_lines.append(AtomicEntityLine([last_pump_pack]+self.entity_array[last_pump+1:i],self.fluid))
				
				last_pump = i
				last_pump_pack = EntityPack(self.entity_array[i].entity,1)
				
				# When there is many pumps put together just add one pump line for completion
				if self.entity_array[i].count > 1:
					atomic_lines.append(AtomicEntityLine([last_pump_pack],self.fluid))
				
			
			# Form a line, when reach the end too
			if i == len(self.entity_array)-1:
				atomic_lines.append(AtomicEntityLine([last_pump_pack]+self.entity_array[last_pump+1:],self.fluid))
		
		flow_list = [iter.flow() for iter in atomic_lines]
		
		index_min = np.argmin(flow_list)
		
		self.overflow_data = copy.deepcopy(atomic_lines[index_min].overflow_data)
		self.underflow_data = copy.deepcopy(atomic_lines[index_min].underflow_data)
		
		return flow_list[index_min]
