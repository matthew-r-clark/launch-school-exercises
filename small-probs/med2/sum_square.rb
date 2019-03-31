# use two helper methods: square_sum and sum_square
# create array of first n positive integers
# send array to both helper methods
# in square_sum, get sum and square that value
# in sum_square, map array with squares, then get sum of values
# return the difference of the two method's return values:
#     square_sum() - sum_square()

# def square_sum(arr)
#   arr.reduce(:+)**2
# end

# def sum_square(arr)
#   arr.map {|num| num**2}.reduce(:+)
# end

# def init_array(n)
#   arr = []
#   1.upto(n) do |num|
#     arr << num
#   end
#   arr
# end

# def sum_square_difference(num)
#   arr = init_array(num)
#   square_sum(arr) - sum_square(arr)
# end

def sum_square_difference(num)
  sum = 0
  sum_of_squares = 0

  1.upto(num) do |value|
    sum += value
    sum_of_squares += value**2
  end

  sum**2 - sum_of_squares
end

p sum_square_difference(3) == 22
# -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150