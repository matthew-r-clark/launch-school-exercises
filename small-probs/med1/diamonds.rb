# Takes in an odd Integer value, n.
# Outputs a 4-pointed diamond of n height and n width.

# Use a loop with boolean value as a switch to change size from increasing to
# decreasing. When line has n length, change boolean variable.
# Store strings in array? Then use a String#center to run each element thru?

def diamond(n, outline_only = false)
  raise "Input lower than '1' (#{n}) not allowed." if n < 1
  raise "Even input (#{n}) is not allowed." if n.even?
  
  diamond = []
  increasing = true
  count = 1

  n.times do
    diamond << "*" * count
    increasing = false if count >= n
    if increasing
      count += 2
    else
      count -= 2
    end
    break if count == 0
  end

  diamond = outline(diamond) if outline_only

  diamond.each {|e| puts e.center(n)}
  puts
end

def outline(diamond)
  diamond[1..-2] = diamond[1..-2].map do |str|
    str[1..-2] = str[1..-2].gsub("*", " ")
    str
  end
  diamond
end

diamond(1)
diamond(5, true)
diamond(9)
diamond(13, true)
diamond(10)
