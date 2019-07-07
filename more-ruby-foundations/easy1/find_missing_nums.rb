# def missing(arr)
#   new_arr = []
#   (arr.first..arr.last).each do |e|
#     new_arr << e unless arr.include?(e)
#   end
#   new_arr
# end

# from LS solution
# def missing(array)
#   result = []
#   array.each_cons(2) do |first, second|
#     result.concat(((first + 1)..(second - 1)).to_a)
#   end
#   result
# end

# without a block
def missing(arr)
  new_arr = []
  counter = 0
  list = (arr.first..arr.last).to_a
  while counter < list.size
    new_arr << list[counter] unless arr.include?(list[counter])
    counter += 1
  end
  new_arr
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []