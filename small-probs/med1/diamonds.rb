# Takes in an odd Integer value, n.
# Outputs a 4-pointed diamond of n height and n width.

# Use a loop with boolean value as a switch to change size from increasing to
# decreasing. When line has n length, change boolean variable.
# Store strings in array? Then use a String#center to run each element thru?

# 1. first attempt
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
    break if count <= 0
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
diamond(13)
diamond(13, true)
diamond(10)


# create n rows, with n width.
# spaces/stars vars will decrease/increase respectively until
# on center line, then reverse.

# 2. second attempt
# def subtract(item, num)
#   item.chars.drop(num).join
# end

# def diamond(size)
#   stars = "*"
#   spaces = " " * ((size - 1) / 2)

#   1.upto(size) do |i|
#     puts spaces + stars + spaces
#     break if i == size

#     if i <= size / 2
#       stars += "**"
#       spaces = subtract(spaces, 1)
#     else
#       stars = subtract(stars, 2)
#       spaces += " "
#     end
#   end
# end


# LS student Connor Bates
# def diamond(ct)
#   ct.times{|n| puts ("*" * (n + 1)).center(ct) if (n + 1).odd?}
#   ct.times{|n| puts ("*" * (ct - (n + 1))).center(ct) if (ct - (n + 1)).odd?}
# end


# LS student Melinda Zwanziger
# further exploration
# def outline_only(arr)
#   arr.map do |row|
#     chars = row.tr('*', ' ').chars
#     chars[0] = '*'
#     chars[-1] = '*'
#     chars.join
#   end
# end

# # original problem
# def diamond(grid_size, outline = 'n')
#   array = []
#   1.upto(grid_size) { |i| array << ('*' * i) if i.odd? }
#   array = (array << array.slice(0..-2).reverse).flatten
#   array = outline_only(array) if outline == 'y'  # further exploration
#   array.each { |row| puts row.center(grid_size) }
# end


# diamond(1)
# diamond(5)
# diamond(13)
# diamond(15)