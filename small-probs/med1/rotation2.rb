# Takes in two Integers.
# Outputs the first Integer with the last n digits rotated, n being the
# second Integer argument.

# 1. convert to string, rotates part of array using slice method.
# def rotate_rightmost_digits(num, n)
#   digits = num.to_s.chars
#   digits[-n..-1] = rotate_array(digits[-n..-1])
#   digits.join.to_i
# end

# 2. using Array#pop and Array#<<
def rotate_rightmost_digits(num, n)
  num = num.digits.reverse
  rotators = num.pop(n)
  result = num + rotate_array(rotators)
  result.join.to_i
end

def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
