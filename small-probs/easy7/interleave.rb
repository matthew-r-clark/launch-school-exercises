# Takes in two Arrays of equal length
# Returns a new Array with values from both original Arrays combined, and
# alternating.

def interleave(arr1, arr2)
  # new_arr = []
  # arr1.size.times do |count|
  #   new_arr << arr1[count] << arr2[count]
  # end
  # new_arr

  # using Array#zip and Array#flatten
  arr1.zip(arr2).flatten
end

puts interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
