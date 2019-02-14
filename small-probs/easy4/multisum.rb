def multisum(num)
  (1..num).to_a.reduce(0) {|t,n| n % 3 == 0 || n % 5 == 0 ? n+t : t}
end

# solution from Launch School - REMEMBER TO USE HELPER METHODS WHEN NECESSARY
# def multiple?(number, divisor)
#   number % divisor == 0
# end
#
# def multisum(max_value)
#   sum = 0
#   1.upto(max_value) do |number|
#     if multiple?(number, 3) || multiple?(number, 5)
#       sum += number
#     end
#   end
#   sum
# end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168
