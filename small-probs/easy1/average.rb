def average(nums)
  # my solution
  # total = 0
  # nums.each do |num|
  #   total += num
  # end
  # total / nums.size

  # launch school solution
  total = nums.reduce(:+)
  total.to_f / nums.count
end

puts average([1, 5, 87, 45, 8, 8])# == 25
puts average([9, 47, 23, 95, 16, 52])# == 40
