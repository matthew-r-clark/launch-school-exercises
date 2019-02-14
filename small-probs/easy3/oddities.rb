def oddities(arr)
  result = []
  arr.each_with_index do |e, i|
    if i.even?
      result << e
    end
  end
  result
end

puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6] ? "Pass" : "Fail"
puts oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5] ? "Pass" : "Fail"
puts oddities(['abc', 'def']) == ['abc'] ? "Pass" : "Fail"
puts oddities([123]) == [123] ? "Pass" : "Fail"
puts oddities([]) == [] ? "Pass" : "Fail"
