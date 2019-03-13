# Takes in an Integer
# Returns a number twice the size of the argument passed in UNLESS
# the argument is a "double number", defined as being the exact same sequence
# of digits on the left and right side.

# Ex: 44, 3333, 103103, 7676 are all double numbers.
#     444, 334433, and 107 are not.

def twice(num)
  double_number?(num) ? num : num * 2
end

def double_number?(num)
  str = num.to_s
  index = str.size/2
  str[0..index-1] == str[index..-1] && index != 0
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10
