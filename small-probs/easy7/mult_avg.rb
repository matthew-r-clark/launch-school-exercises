# Takes in an array of Integers, will never be empty.
# Multiply all numbers together.
# Divide the result by the number of array values.
# Output the result rounded to 3 decimal places.

def show_multiplicative_average(arr)
  result = arr.reduce(:*) / arr.size.to_f
  p "The result is #{sprintf("%.3f", result)}"
end

show_multiplicative_average([3, 5])
# => The result is 7.500

show_multiplicative_average([6])
# => The result is 6.000

show_multiplicative_average([2, 5, 7, 11, 13, 17])
# => The result is 28361.667
