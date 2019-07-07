items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# 1
puts "# 1 ===================="
gather(items) do |*first_three, wheat|
  puts first_three.join(", ")
  puts wheat
end

# => Let's start gathering food.
# => apples, corn, cabbage
# => wheat
# => We've finished gathering!

# 2
puts "\n\n# 2 ===================="
gather(items) do |apples, *middle_two, wheat|
  puts apples
  puts middle_two.join(", ")
  puts wheat
end

# => Let's start gathering food.
# => apples
# => corn, cabbage
# => wheat
# => We've finished gathering!

# 3
puts "\n\n# 3 ===================="
gather(items) do |apples, *last_three|
  puts apples
  puts last_three.join(", ")
end

# => Let's start gathering food.
# => apples
# => corn, cabbage, wheat
# => We've finished gathering!

# 4
puts "\n\n# 4 ===================="
gather(items) do |apples, corn, cabbage, wheat|
  puts "#{apples}, #{corn}, #{cabbage}, and #{wheat}"
end

# => Let's start gathering food.
# => apples, corn, cabbage, and wheat
# => We've finished gathering!