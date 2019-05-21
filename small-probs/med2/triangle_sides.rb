# equilateral - All 3 sides are of equal length
# isosceles - 2 sides are of equal length, while the 3rd is different
# scalene - All 3 sides are of different length

# To be a valid triangle, the sum of the lengths of the two
# shortest sides must be greater than the length of the longest
# side, and all sides must have lengths greater than 0: if either
# of these conditions is not satisfied, the triangle is invalid.

# Write a method that takes the lengths of the 3 sides of a triangle
# as arguments, and returns a symbol :equilateral, :isosceles,
# :scalene, or :invalid depending on whether the triangle is
# equilateral, isosceles, scalene, or invalid.

#------
# Take in arguments as an array using splat operator.
# Sort array.
# Return :invalid if two shortest sides are not greater than longest
# Return :equilateral if all three elements are equal
# Return :isosceles if two sides are equal
# Otherwise return :scalene
# -----

def triangle(*sides)
  sides.sort!
  return :invalid if sides[0..1].reduce(:+) <= sides[2]
  return :equilateral if sides.uniq.count == 1
  return :isosceles if sides.uniq.count == 2
  :scalene
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(2, 3, 2) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid