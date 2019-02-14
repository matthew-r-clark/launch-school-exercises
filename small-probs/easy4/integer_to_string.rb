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

puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'
