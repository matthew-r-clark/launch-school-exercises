# Takes in two arrays of Integer values.
# Returns a new array with the values of each pair from the two arrays
# multiplied together.
# new_array.size == input_arr1.size * input_arr2.size

# Use nested looping

def multiply_all_pairs(arr1, arr2)
  new_arry = []
  arr1.each do |e_1|
    arr2.each do |e_2|
      new_arry << e_1 * e_2
    end
  end
  new_arry.sort

  # compact example from Launch School:
  # arr1.product(arr2).map {|e_1, e_2| e_1 * e_2}.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
