# Takes in an array, returns an array with two nested arrays that each have
# half of the original array's values. Arrays with odd number of values will
# be split so that the middle value goes into the first half array.

# Divide array size by 2, if odd adjust accordingly, set index variable for
# end of first array, add 1 for start of second array.

def halvsies(arr)
  index = arr.size / 2
  index -= 1 if arr.size.even?
  [arr[0..index],arr[index+1..-1]]
end

# launch school solution:
# def halvsies(array)
#   first_half = array.slice(0, (array.size / 2.0).ceil)
#   second_half = array.slice(first_half.size, array.size - first_half.size)
#   [first_half, second_half]
# end

puts halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
puts halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
puts halvsies([5]) == [[5], []]
puts halvsies([]) == [[], []]
