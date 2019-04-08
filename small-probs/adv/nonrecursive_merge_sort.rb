def merge(array1, array2)
  index2 = 0
  result = []

  array1.each do |value|
    while index2 < array2.size && array2[index2] <= value
      result << array2[index2]
      index2 += 1
    end
    result << value
  end

  result.concat(array2[index2..-1])
end

# Taken from Hai Cu in student solutions
def merge_sort(array)
  size = 2
  loop do
    n = 0
    main_array = []
    half = size / 2
    loop do
      temp = array[n, size]
      arr1 = temp.take(half)
      arr2 = temp.drop(half)
      main_array += merge(arr1, arr2)
      n += size
      break if n >= array.length
    end
      size *= 2
      array = main_array
      break array if size >= array.length * 2
  end
end


p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]