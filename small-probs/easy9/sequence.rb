# Takes in an Integer argument.
# Returns an array of all Integers, in sequence, between 1 and the argument.

# Create new array, use upto method to append values to array.

def sequence(num)
  num > 0 ? (1..num).to_a : (num..1).to_a.reverse
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
p sequence(20) == (1..20).to_a
p sequence(-1) == [1, 0, -1]
p sequence(-5) == [1, 0, -1, -2, -3, -4, -5]
