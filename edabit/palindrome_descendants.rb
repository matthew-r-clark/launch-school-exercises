# A number may not be a palindrome, but it's descendant can be.
# A number's direct child is created by summing each pair of
# adjacent digits to create the digits of the next number.

# For instance, 123312 is not a palindrome, but it's next child
# 363 is, where: 3 = 1 + 2; 6 = 3 + 3; 3 = 1 + 2.

# Create a function that returns true if the number itself is
# a palindrome or any of its descendants down to 2 digits
# (a 1-digit number is trivially a palindrome).

# input: integer, with even number of digits
# output: boolean, depending on whether it or any descendants
# are palindromes

# convert number into array of digits
# use a loop that checks if number is palindrome, and if not
# calculates descendant
# loop breaks when currently evaluated number is 2 digits or less
# From Edabit, Edabit is using older verison of Ruby, doesn't have #digits

def palindrome_descendant(num)
  digits = num.to_s.split('').map {|e| e.to_i}
  result = false
  loop do
    break if digits.size <= 1
    result = true if digits == digits.reverse
    temp = []
    (digits.size / 2).times do |num|
      first = digits[num*2]
      second = digits[num*2 + 1] == nil ? 0 : digits[num*2 + 1]
      temp << first + second
    end
    digits = temp.join.split('').map {|e| e.to_i}
  end
  result
end

p palindrome_descendant(11211230) == false
p palindrome_descendant(13001120) == true
p palindrome_descendant(23336014) == true
p palindrome_descendant(11) == true
p palindrome_descendant(1122) == false
p palindrome_descendant(332233) == true
p palindrome_descendant(10210112) == true
p palindrome_descendant(9735) == false
p palindrome_descendant(97358817) == false