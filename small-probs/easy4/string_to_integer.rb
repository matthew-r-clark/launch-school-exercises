DIGITS = {'0'=>0,'1'=>1,'2'=>2,'3'=>3,'4'=>4,
         '5'=>5,'6'=>6,'7'=>7,'8'=>8,'9'=>9}

def string_to_integer(str)
  str.chars.map { |char| DIGITS[char] }.
  reduce(0) { |value, digit| 10 * value + digit }
end

puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570
