# Takes in two Integers. First argument is a count, second is first number
# of a sequence that your method will create.
# Returns an Array that contains the same number of elements as the count
# argument, while the values of each element will be multiples of the second
# argument (the starting number).
# Count argument will always be >= 0.
# Starting number can be any Integer value.
# If count == 0, an empty list should be returned.

def sequence(count, start)
  # series = []
  # 1.upto(count) { |num| series << start * num }
  # series

  # LS solution:
  (1..count).map {|num| num * start}
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []
