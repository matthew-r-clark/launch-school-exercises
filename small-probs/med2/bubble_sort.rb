# using two index values, step through array comparing element values
# if left element is greater, do inplace swap
# use boolean variable to keep track of whether a swap was made each pass

# def bubble_sort!(arr)
#   loop do
#     left = 0
#     right = 1
#     no_swaps = true

#     loop do
#       if arr[left] > arr[right]
#         arr[left], arr[right] = arr[right], arr[left]
#         no_swaps = false
#       end

#       break if right == arr.size - 1
#       left += 1
#       right += 1
#     end
#     break if no_swaps
#   end
#   nil
# end

# Algorithm from wikipedia:
#https://en.wikipedia.org/wiki/Bubble_sort#Optimizing_bubble_sort

def bubble_sort!(arr)
  size = arr.size
  loop do
    resize = 0
    1.upto(size - 1) do |i|
      if arr[i-1] > arr[i]
        arr[i], arr[i-1] = arr[i-1], arr[i]
        resize = i
      end
    end

    size = resize

    break if size <= 1
  end
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