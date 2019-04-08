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

def jugs_dup(jugs)
  copy = {}
  jugs.each {|key, val| copy[key] = val.dup}
  copy
end

def initialize_jugs(capacities, goal_states)
  jugs = {0=>{}, 1=>{}, 2=>{}, operations: 0}

  capacities.each_with_index do |element, index|
    jugs[index][:capacity] = element
    jugs[index][:water] = index == 2 ? element : 0
    jugs[index][:goal] = goal_states[index]
  end

  jugs # {capacity => current water}
end

def empty_jug!(jugs, jug)
  # puts "emptying jug #{jug}"
  jugs[jug][:water] = 0
  jugs[:operations] += 1
  jugs
end

def fill_jug!(jugs, jug)
  # puts "filling jug #{jug}"
  jugs[jug][:water] = jug[:capacity]
  jugs[:operations] += 1
  jugs
end

def pour_jug!(jugs, giving, receiving)
  # puts "pouring jug #{giving} into jug #{receiving}"
  giving, receiving = jugs[giving], jugs[receiving]
  max_fill = receiving[:capacity] - receiving[:water]
  if giving[:water] > max_fill
    giving[:water] -= max_fill
    receiving[:water] += max_fill
  elsif giving[:water] <= max_fill
    receiving[:water] = giving[:water]
    giving[:water] = 0
  end
  jugs[:operations] += 1
  jugs
end

def finished?(jugs)
  jugs.select {|key, val| (0..2).include?(key)}
  .each { |key, jug| return false if jug[:water] != jug[:goal] }
  true
end

def solve(jugs)
  return jugs[:operations] if finished?(jugs)
  return nil if jugs[:operations] >= 10

  puts "Jug1: #{jugs[0][:water]}/#{jugs[0][:goal]}, Jug2: #{jugs[1][:water]}/#{jugs[1][:goal]}, Jug3: #{jugs[2][:water]}/#{jugs[2][:goal]}, Ops: #{jugs[:operations]}"

  paths = [
    solve(pour_jug!(jugs_dup(jugs), 0, 1),), # pour from 0 to 1
    # solve(pour_jug!(jugs_dup(jugs), 0, 2),), # pour from 0 to 2
    # solve(pour_jug!(jugs_dup(jugs), 1, 0),), # pour from 1 to 0
    # solve(pour_jug!(jugs_dup(jugs), 1, 2),), # pour from 1 to 2
    solve(pour_jug!(jugs_dup(jugs), 2, 0),), # pour from 2 to 0
    # solve(pour_jug!(jugs_dup(jugs), 2, 1),) # pour from 2 to 1
    # solve(fill_jug!(jugs_dup(jugs), 0)) # fill 0
    # solve(fill_jug!(jugs_dup(jugs), 1)) # fill 1
    # solve(fill_jug!(jugs_dup(jugs), 2)) # fill 2
    # solve(empty_jug!(jugs_dup(jugs), 0)) # empty 0
    # solve(empty_jug!(jugs_dup(jugs), 1)) # empty 1
    # solve(empty_jug!(jugs_dup(jugs), 2)) # empty 2
].flatten.uniq.compact

end

def waterjug(jug_capacities, goal_states)
  return "No solution." if jug_capacities[2] != goal_states.reduce(:+)
  jugs = initialize_jugs(jug_capacities, goal_states)

  solution = solve(jugs)

  # solution.empty? ? "No solution." : solution.min
end

p waterjug([3, 5, 8], [0, 3, 5]) #== 2
# p waterjug([1, 3, 4],  [0, 2, 2]) #== 3
# p waterjug([8, 17, 20], [0, 10, 10]) #== 9
# p waterjug([4, 17, 22], [2, 5, 15]) #== "No solution."
# p waterjug([3, 5, 8], [0, 0, 9]) #== "No solution."