# Takes in a String, returns a Hash that contains 3 key/value pairs:
#   1. number of lowercase letters
#   2. number of uppercase letters
#   3. number of other characters

LOWERS = ('a'..'z').to_a
UPPERS = ('A'..'Z').to_a

# def letter_case_count(str)
#   letter_count = {lowercase: 0, uppercase: 0, neither: 0}
#   str.chars.each do |char|
#     if LOWERS.include?(char)
#       letter_count[:lowercase] += 1
#     elsif UPPERS.include?(char)
#       letter_count[:uppercase] += 1
#     else
#       letter_count[:neither] += 1
#     end
#   end
#   letter_count
# end

# launch school example
def letter_case_count(str)
  counts = {}
  chars = str.chars
  counts[:lowercase] = chars.count { |char| char =~ /[a-z]/ }
  counts[:uppercase] = chars.count { |char| char =~ /[A-Z]/ }
  counts[:neither] = chars.count { |char| char =~ /[\W\D]/ }
  counts
end

puts letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
puts letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
puts letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
puts letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
