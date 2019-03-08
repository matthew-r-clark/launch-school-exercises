# Takes in two arrays of the same length.
# Multiply elements from each array at the same index and return a new array
# with those values.

def multiply_list(arr1, arr2)
  # mult_arr = Array.new(arr1.size)
  # mult_arr.map.with_index { |_, i| arr1[i] * arr2[i] }

  # one-liner using Array#zip:
  arr1.zip(arr2).map { |arr| arr.reduce(:*) }
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
