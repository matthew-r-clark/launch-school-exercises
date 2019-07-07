def zip(arr1, arr2)
  count = 0
  new_arr = []
  while count < arr1.size
    new_arr << [arr1[count], arr2[count]]
    count += 1
  end
  new_arr
end

# additional solution from LS
# def zipper(array1, array2)
#   result = []
#   array1.each_with_index do |element, index|
#     result << [element, array2[index]]
#   end
#   result
# end

# additional solution from LS
# def zipper(array1, array2)
#   array1.each_with_index.with_object([]) do |(element, index), result|
#     result << [element, array2[index]]
#   end
# end

puts zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]