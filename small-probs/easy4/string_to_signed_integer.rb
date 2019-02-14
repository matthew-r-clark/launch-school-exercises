DIGITS = {'0'=>0,'1'=>1,'2'=>2,'3'=>3,'4'=>4,
         '5'=>5,'6'=>6,'7'=>7,'8'=>8,'9'=>9}

def string_to_integer(str)
  str.chars.map { |char| DIGITS[char] }.
  reduce(0) { |value, digit| 10 * value + digit }
end

def string_to_signed_integer(str)
  sign = 1
  without_first = str[1..-1]
  
  case str[0]
  when '-'
    sign = -1
    str = without_first
  when '+'
    str = without_first
  end
  string_to_integer(str) * sign
end

puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100
