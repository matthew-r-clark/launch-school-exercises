# Take in Array of Integers (positive, negative, or 0) and another Integer
# Return the first two Integers from array whose sum is equal to second
# argument. They must be the first complete pair (when the entire pair
# is earlier than any other number of a pair).
# If no pairs fit requirements, return nil.
# Some lists will have a length of over 10,000,000 elements.

# can remove any number that is greater than the target_sum IF there
# are no negative values or if a number is greater than the target_sum
# plus the smallest negative value's absolute value

# find each pair, store the index values in an array of two element arrays
# then return the pair of index values for which the second element of the
# pair is the lowest value of all.



# def trim(arr, target_sum)
#   upper_limit = target_sum
#   upper_limit += arr.min.abs if arr.min < 0
#   arr.select {|val| val <= upper_limit}
# end

# def find_target_indices(pairs)
#   pairs.min_by {|element| element[1]}
# end

# def find_pairs(arr, target_sum)
#   pairs = []
#   target_indices = []

#   arr.size.times do |outer_index|
#     target_indices = find_target_indices(pairs) unless pairs.empty?
#     stop_index = target_indices.empty? ? arr.size - 1 : target_indices[1]
#     next_outer_loop = false

#     (outer_index+1).upto(stop_index) do |inner_index|
#       if next_outer_loop
#         next
#       elsif arr[outer_index] + arr[inner_index] == target_sum
#         pairs << [outer_index, inner_index]
#         next_outer_loop = true
#       end
#     end
#   end

#   pairs
# end

# def sum_pairs(arr, target_sum)
#   arr = trim(arr, target_sum)
#   pairs = find_pairs(arr, target_sum)
#   return nil if pairs == []
#   target_indices = find_target_indices(pairs)
#   target_indices.map {|index_val| arr[index_val]}
# end

# Solution from https://medium.com/@riabtchuk/iterating-through-large-arrays-in-ruby-b9f97dd8315c

def sum_pairs(numbers, target)
  seen = {}
  for num in numbers do
    return [target-num, num] if seen[target-num]
    seen[num] = true
  end
  nil
end

p sum_pairs([11, 3, 7, 5], 10) == [3,7]
p sum_pairs([4, 3, 2, 3, 4], 6) == [4,2]
p sum_pairs([0, 0, -2, 3], 2) == nil
p sum_pairs([10, 5, 2, 3, 7, 5], 10) == [3,7]
p sum_pairs([5, 22, -7, 3, 5, 17, 33], 10) == [5,5]
