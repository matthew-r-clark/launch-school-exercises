# Takes in Integer and returns "maximum rotation of the original number"

def max_rotation(num)
  count = num.to_s.size
  while count > 0
    num = rotate_rightmost_digits(num, count)
    count -= 1
  end
  num
end

def rotate_rightmost_digits(num, n)
  digits = num.to_s.chars
  digits[-n..-1] = rotate_array(digits[-n..-1])
  digits.join.to_i
end

def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
