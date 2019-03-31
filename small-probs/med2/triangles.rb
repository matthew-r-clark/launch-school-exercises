# return :invalid if sum of angles != 180 or any angle is <= 0
# return :obtuse if any angle > 90
# return :right if any angle == 90
# otherwise return :acute

def triangle(*angles)
  return :invalid if angles.reduce(:+) != 180 || angles.any?(0)
  return :obtuse if angles.max > 90
  return :right if angles.any?(90)
  :acute  
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid
p triangle(90, 1, 89)
p triangle(91, 1, 89)