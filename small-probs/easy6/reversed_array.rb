# Take in an array object, without using Array#reverse
# or Array#reverse! return the same array object in reverse order.

# Copy array, reverse the copy, then based on index reassign each value in
# original array to the values in the reversed copy.

def create_copy(arr)
  copy = []
  arr.each { |e| copy.unshift(e) }
  copy
end

def reverse!(arr)
  copy = create_copy(arr)
  arr.each_index {|i| arr[i] = copy[i]}
  arr
end

# Tests
puts "Example 1"
list = [1,2,3,4]
result = reverse!(list)
puts result == [4, 3, 2, 1]
puts list == [4, 3, 2, 1]
puts list.object_id == result.object_id

puts "Example 2"
list = %w(a b e d c)
puts reverse!(list) == ["c", "d", "e", "b", "a"]
puts list == ["c", "d", "e", "b", "a"]

puts "Example 3"
list = ['abc']
puts reverse!(list) == ["abc"]
puts list == ["abc"]

puts "Example 4"
list = []
puts reverse!(list) == []
puts list == []
