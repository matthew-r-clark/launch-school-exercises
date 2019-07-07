# def drop_while(arr)
#   continue = true
#   result = []
#   arr.each do |item|
#     proc_return = yield(item)
#     if continue
#       if !proc_return
#         result << item
#         continue = false
#       end
#     else
#       result << item
#     end
#   end
#   result
# end

def drop_while(arr)
  i = 0
  while i < arr.size && yield(arr[i])
    i += 1
  end
  arr[i..-1]
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []