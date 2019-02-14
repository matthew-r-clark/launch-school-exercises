DIGITS = ('0'..'9').to_a

def integer_to_string(num)
  string = ''
  loop do
    digit = num % 10
    string << DIGITS[digit]
    num = (num - digit) / 10
    break if num == 0
  end
  string.reverse
end

def signed_integer_to_string(num)
  if num > 0
    sign = '+'
  elsif num < 0
    sign = '-'
    num *= -1
  else
    sign = ''
  end
  sign + integer_to_string(num)
end

puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'
