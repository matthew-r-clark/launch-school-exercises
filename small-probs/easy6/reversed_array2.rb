# Takes in an array of numbers, returns a new array with the values reversed.

# Create a new array and add the values from original array to the new array
# in reverse order.

def reverse(arr)
  # copy = []
  # arr.each { |e| copy.unshift(e) }
  # copy

  # Now trying to solve with Enumerable#each_with_object
  # arr.each_with_object([]) { |e, copy| copy.unshift(e) }

  # Now trying to solve with Enumerable#inject
  arr.inject([]) { |copy, e| copy.unshift(e) }
end

# There is another handy method: Array#reverse_each

puts reverse([1,2,3,4]) == [4,3,2,1]          # => true
puts reverse(%w(a b e d c)) == %w(c d e b a)  # => true
puts reverse(['abc']) == ['abc']              # => true
puts reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
puts list.object_id != new_list.object_id  # => true
puts list == [1, 3, 2]                     # => true
puts new_list == [2, 3, 1]                 # => true
