# Write a method that takes an Array as an argument,
# and sorts that Array using the bubble sort algorithm
# as just described. Note that your sort will be
# "in-place"; that is, you will mutate the Array
# passed as an argument. You may assume that the Array
# contains at least 2 elements.

# Input: Array
# Output: The same array object, sorted

# In a loop iterate through array excluding last element,
# starting with first element (i) and second element (i+1),
# switch elements if i > i+1.
# Break out of loop first time no changes are made (boolean var)
# Return the array.

def bubble_sort!(array)
  loop do
    finished = true
    (array.size-1).times do |i|
      if array[i] > array[i+1]
        array[i], array[i+1] = array[i+1], array[i]
        finished = false
      end
    end
    break if finished
  end

  array
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

array = [101, 3, -17, 1]
bubble_sort!(array)
p array == [-17, 1, 3, 101]