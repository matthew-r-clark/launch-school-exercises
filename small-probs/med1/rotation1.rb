# Takes in an Array.
# Returns a new Array with all values rotated one position so that
# the first element is now at the end of the Array.

# shift the first element off and append it back to the end of the Array.

def rotate_array(arr)
  arr = arr.dup
  mover = arr.shift
  arr << mover
  arr

  # LS solution:
  # arr[1..-1] + [arr[0]]
end

def rotate_string(str)
  rotate_array(str.chars).join
end

def rotate_integer(num)
  rotate_string(num.to_s).to_i
end

puts "Array tests:"
p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true

puts "\nString Tests:"
p rotate_string("!Happy Birthday") == "Happy Birthday!"
p rotate_string("wMatthe") == "Matthew"

puts "\nInteger tests:"
p rotate_integer(12345) == 23451
p rotate_integer(122) == 221
