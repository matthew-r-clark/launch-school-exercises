# You have a list of number. Move around the number to obtain the largest possible number.
# Numbers in the list can have 1 to n digits. Have a look to the test cases.

# def largest_number(array)
#   max_size = array.max.digits.size
#   array.sort_by do |num|
#     digits = num.digits.sort.reverse
#     while digits.size < max_size
#       digits << digits[-1]
#     end
#     digits
#   end.reverse.join.to_i
# end

# From Faouzi
def largest_number(a)
  if a.all? { |value| value.to_s.length == 1 }
    a = a.sort { |x, y| y<=>x }
  else
    a = a.sort { |x, y| "#{y}#{x}".to_i<=>"#{x}#{y}".to_i }
  end

  a.join('')
end

p largest_number([21, 2]) #== 221
p largest_number([9, 4, 6, 1, 9]) #== 99641
p largest_number([9, 63, 123, 8, 7]) #== 98763123
p largest_number([92, 97, 95]) #== 979592