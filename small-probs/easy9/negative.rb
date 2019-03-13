# Takes in a number and always returns a negative value, unless 0.

def negative(num)
  # num < 0 ? num : -num
  -num.abs
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0
p negative(2.6457) == -2.6457
p negative(-3.1) == -3.1
