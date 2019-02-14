def sum(num)
  # get list of digits
  # get sum of digits
  # return sum
  num.to_s.chars.map(&:to_i).reduce(:+)
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
