# Takes in an Integer value which represents the size of the sides on a
# right triangle. Method displays the tringle to the screen using asterisks
# so that the ends of the hypotenuse are in the bottom left corner and the
# top right corner.

# set a counter variable that will increment the number of
# stars and decrement the number of spaces on each subsequent line.

def triangle(n)
  stars = 1
  n.times do
    puts (" " * (n-stars)) + ("*" * stars)
    stars += 1
  end

end

triangle(2)
triangle(4)
triangle(9)
triangle(21)
