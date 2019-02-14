def multiply(x, y)
  x * y
end

def square(x)
  multiply(x, x)
end

puts square(5) == 25 ? "Pass" : "Fail"
puts square(-8) == 64 ? "Pass" : "Fail"
