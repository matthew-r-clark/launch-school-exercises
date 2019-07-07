# def count(collection)
#   counter = 0
#   collection.each {|e| counter += 1 if yield(e)}
#   counter
# end

# further exploration
# not using each, loop, while, or until.
# def count(collection)
#   counter = 0
#   collection.size.times do |i|
#     counter += 1 if yield collection[i]
#   end
#   counter
# end

def count(collection)
  collection.select { |item| yield(item) }.size
end

puts count([1,2,3,4,5]) { |value| value.odd? } == 3
puts count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
puts count([1,2,3,4,5]) { |value| true } == 5
puts count([1,2,3,4,5]) { |value| false } == 0
puts count([]) { |value| value.even? } == 0
puts count(%w(Four score and seven)) { |value| value.size == 5 } == 2