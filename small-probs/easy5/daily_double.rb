# Takes a string argument and returns a new string that is a copy of the
# original string but with any grouping of the same character stripped down
# to only one of that character. If there are no groups, or the string is
# empty, return a new string that is identical to the original.

# data structure: Array or String?

# psuedocode:
# Iterate through characters, starting with 2nd character, checking to see
# if the current character is equal to the previous character. If the
# current character is NOT equal to the previous character, it gets selected
# and added to the new string.

# Using Array
# def crunch(str)
#   stripped = []
#   str.chars.each_with_index do |char, idx|
#     if idx == 0
#       stripped << char
#     else
#       stripped << char if char != str[idx-1]
#     end
#   end
#   stripped.join
# end

# Using String
def crunch(str)
  index = 0
  crunch_str = ''
  while index < str.length
    crunch_str << str[index] unless str[index] == str[index + 1]
    index += 1
  end
  crunch_str
end

puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba'
puts crunch('ggggggggggggggg') == 'g'
puts crunch('a') == 'a'
puts crunch('') == ''
puts crunch('ddaaiillyy ddoouubbllee')
