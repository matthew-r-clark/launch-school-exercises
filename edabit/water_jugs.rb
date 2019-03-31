# Given a set of 3 jugs of water that have capacities of a, b, and c liters, 
# find the minimum number of operations performed before each jug has x, y, 
# and z liters. Only jug C will start completely filled.

# An operation is any of the following: A jug is emptied, a jug is filled, 
# or water is poured from one jug to another until one of the jugs is either 
# empty or full.

# For example, jugs 'A', 'B, and 'C' with capacities of 3, 5, and 8, where 
# jugs 'A' and 'B' start empty and 'C' has the full 8, require 2 operations 
# to reach the state of 0, 3, and 5 liters in the jugs.

# Create a function that, given an array of jug capacities [A, B, C] and an 
# goal state array [x, y, z], returns the minimum number of operations needed 
# to reach the goal state. If the inputs are invalid or there is no solution, 
# return "No solution."

require 'pry'

def initialize_jugs(capacities, goal_states)
  jugs = [{},{},{}]

  capacities.each_with_index do |element, index|
    jugs[index][:capacity] = element
    jugs[index][:water] = index == 2 ? element : 0
    jugs[index][:goal] = goal_states[index]
  end

  jugs # {capacity => current water}
end

def empty_jug!(jug)
  jug[:water] = 0
end

def fill_jug!(jug)
  jug[:water] = jug[:capacity]
end

def create_pathways()
  options = {0=>[1,2], 1=>[0,2], 2=>[0,1]}
  pathways = []



  pathways
end

def find_solution(jug_capacities, goal_states)
  jugs = {}
  attempts = []
  num_ops = 0

  pathways = create_pathways

  pathways.each do |pathway|
    jugs = initialize_jugs(jug_capacities, goal_states)
    pouring = 2

    pathway.each do |receiving|
      pour_jug!(jugs[pouring], jugs[receiving])
      num_ops += 1
      pouring = receiving
      break if finished?(jugs)
    end

    attempts << num_ops
    num_ops = 0
  end

  finished?(jugs) ? attempts.min : "No solution."
end

def pour_jug!(giving, receiving)
  max_fill = receiving[:capacity] - receiving[:water]
  if giving[:water] > max_fill
    giving[:water] -= max_fill
    receiving[:water] += max_fill
    "reciving jug filled to max"
  elsif giving[:water] <= max_fill
    receiving[:water] = giving[:water]
    giving[:water] = 0
    "giving jug completely empty"
  end
end

def finished?(jugs)
  jugs.each { |jug| return false if jug[:water] != jug[:goal] }
  true
end

def waterjug(jug_capacities, goal_states)
  return "No solution." if jug_capacities[2] != goal_states.reduce(:+)

  # find_solution(jug_capacities, goal_states)
  create_pathways
end

# p waterjug([3, 5, 8], [0, 3, 5]) #== 2
p waterjug([1, 3, 4],  [0, 2, 2]) #== 3
p waterjug([8, 17, 20], [0, 10, 10]) #== 9
# p waterjug([4, 17, 22], [2, 5, 15]) #== "No solution."
# p waterjug([3, 5, 8], [0, 0, 9]) #== "No solution."