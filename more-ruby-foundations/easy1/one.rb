def one?(collection)
  found_one = false
  collection.each do |e|
    next unless yield(e)
    return false if found_one
    found_one = true
  end
  found_one
end

puts one?([1, 3, 5, 6]) { |value| value.even? }    == true
puts one?([1, 3, 5, 7]) { |value| value.odd? }     == false
puts one?([2, 4, 6, 8]) { |value| value.even? }    == false
puts one?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
puts one?([1, 3, 5, 7]) { |value| true }           == false
puts one?([1, 3, 5, 7]) { |value| false }          == false
puts one?([]) { |value| true }                     == false