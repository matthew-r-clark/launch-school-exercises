# [9, 5, 7, 1] ->
# [[9, 5], [7, 1]] ->
# [[[9], [5]], [[7], [1]]]
# We then work our way back to a flat array by merging each pair of nested sub-arrays:
# [[[9], [5]], [[7], [1]]] ->
# [[5, 9], [1, 7]] ->
# [1, 5, 7, 9]



def merge(arr1, arr2=[])
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

def merge_sort(arr)
  if arr.size > 1
    index = arr.size/2
    merge(merge_sort(arr[0...index]), merge_sort(arr[index..-1]))
  else
    return arr
  end
end



p merge_sort([9, 5, 7, 1]) #== [1, 5, 7, 9]
p merge_sort([5, 3]) #== [3, 5]
p merge_sort([6, 2, 7, 1, 4]) #== [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) #== %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) #== [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]