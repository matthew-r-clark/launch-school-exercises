# create index variables that iterate through two arrays only
# after the value has been added to the new array.

# compare two current array index values and add the lowest to
# the new array, then increase that array's index value by 1.

# when index value == array size (aka last item has been added
# to new array and index value increased outside of array boundary),
# just add the remaining values from the other array.

def merge(arr1, arr2)
  ind1 = ind2 = 0
  new_arr = []

  loop do
    break if arr1 == [] || arr2 == []
    if arr1[ind1] > arr2[ind2]
      new_arr << arr2[ind2]
      ind2 += 1
    else
      new_arr << arr1[ind1]
      ind1 += 1
    end
    break if ind1 >= arr1.size || ind2 >= arr2.size
  end

  if ind1 == arr1.size
    temp = arr2[ind2..-1]
  else
    temp = arr1[ind1..-1]
  end

  temp.each {|element| new_arr << element}

  new_arr
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]