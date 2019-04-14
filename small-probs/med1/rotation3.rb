# Takes in Integer and returns "maximum rotation of the original number"

# 1. while loop
# def max_rotation(num)
#   count = num.to_s.size
#   while count > 1
#     num = rotate_rightmost_digits(num, count)
#     count -= 1
#   end
#   num
# end

# 2. Integer#downto
def max_rotation(num)
  num.to_s.size.downto(2) do |rotators|
    num = rotate_rightmost_digits(num, rotators)
  end
  num
end

# 3. Array#delete_at (LS students)
# def max_rotation(num)
#   result = num.to_s.chars
#   # iterates through array, deleting element at index and appending it to end of array
#   result.size.times { |digit| result << result.delete_at(digit) }
#   result.join.to_i
# end

# 4. double shift (Jemima Kingsley)
# def max_rotation(number)
#   digit_array = number.to_s.chars
#   number_str = ''

#   digit_array.size.times do
#     digit_array << digit_array.shift
#     number_str << digit_array.shift
#   end
#   number_str.to_i
# end

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
