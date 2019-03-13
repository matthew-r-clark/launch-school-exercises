# Takes in two Integers.
# Outputs the first Integer with the last n digits rotated, n being the
# second Integer argument.

def rotate_rightmost_digits(num, rotators)
  digits = num.to_s.chars
  digits[-rotators..-1] = rotate_array(digits[-rotators..-1])
  digits.join.to_i
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
