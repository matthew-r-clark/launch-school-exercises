# https://www.codewars.com/kata/last-digit-of-a-huge-number/train/ruby
# resource: https://brilliant.org/wiki/finding-the-last-digit-of-a-power/
# For a given list [x1, x2, x3, ..., xn] compute the last
# (decimal) digit of x1 ^ (x2 ^ (x3 ^ (... ^ xn))).

# E. g.,
# last_digit({3, 4, 2}, 3) == 1
# because 3 ^ (4 ^ 2) = 3 ^ 16 = 43046721.

# Beware: powers grow incredibly fast. For example,
# 9 ^ (9 ^ 9) has more than 369 millions of digits.
# lastDigit has to deal with such numbers efficiently.

# Corner cases: we assume that 0 ^ 0 = 1 and that

# lastDigit of an empty list equals to 1.

# This kata generalizes Last digit of a large number;
# you may find useful to solve it beforehand.

PATTERNS = {
  1 => [1],
  2 => [2, 4, 8, 6],
  3 => [3, 9, 7, 1],
  4 => [4, 6],
  5 => [5],
  6 => [6],
  7 => [7, 9, 3, 1],
  8 => [8, 4, 2, 6],
  9 => [9, 1]
}

# ending condition: numbers array has only one element
# 

def last_digit(numbers)
  return 1 if numbers == []
  return numbers.first if numbers.size == 1
  num = numbers.first
  pow = last_digit(numbers[1..-1])

end

p last_digit([3, 4, 2]) #== 1
p last_digit([]) #== 1
p last_digit([0, 0]) #== 1
p last_digit([0, 0, 0]) #== 0
p last_digit([1, 2]) #== 1
p last_digit([3, 4, 5]) #== 1
p last_digit([4, 3, 6]) #== 4
p last_digit([7, 6, 21]) #== 1
p last_digit([12, 30, 21]) #== 6
p last_digit([2, 2, 2, 0]) #== 4
p last_digit([937640, 767456, 981242]) #== 0
p last_digit([123232, 694022, 140249]) #== 6
p last_digit([499942, 898102, 846073]) #== 6


# Only works was long as calculated numbers aren't Infinity:
# def find_num(numbers)
#   return numbers.first if numbers.size == 1
#   numbers.first ** find_num(numbers[1..-1])
# end

# def last_digit(numbers)
#   return 1 if numbers == []
#   find_num(numbers).digits.first
# end