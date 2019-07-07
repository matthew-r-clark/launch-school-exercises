
def compute(arg)
  return "What should be done with '#{arg}'?" unless block_given?
  yield(arg)
end

puts compute(5) { |num| num + 3 } == 8
puts compute('a') { |letter| letter + 'b' } == 'ab'
puts compute(1) == "What should be done with '1'?"