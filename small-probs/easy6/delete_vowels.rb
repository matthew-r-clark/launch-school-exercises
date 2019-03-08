# Take in an array of strings, return array with same string values
# with the vowels removed.

# Data Structure: Array, utilize array#map.

# Iterate through String objects in the Array.
# Perform String#gsub on each String object, replacing vowels with ''
# Return the Array

def remove_vowels(arr)
  arr.map{|e| e.delete('aeiouAEIOU')}
end

puts remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
puts remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
puts remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
