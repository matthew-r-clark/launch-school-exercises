# print a sine wave with three input variables:
# width, height, number of waves (counting tops only)
  # width must be perfectly divisible by number of waves
  # height must be odd

# create one segment and then duplicate it appropriate times
# divide `width` by `waves` to get each segment's width
# 

# def sine(width, height, waves)
#   segment_width = width / waves

#   wave = []

#   empty_side = " " * (segment_width / 2)
#   outer = (segment_width / 4) - 1
#   inner = 0
#   halves = (segment_width - 2) / 2.0
#   height_tracker = height
#   outer_increment = ((height / 4.0).round - 1) / (segment_width / 2.0)
#   inner_increment = outer_increment * 10

#   loop do # left side
#     if halves.round.even? && height_tracker == height
#       puts "#{" " * (outer + 1)}*#{" " * outer}"
#     else
#       puts "#{" " * outer}*#{" " * inner}*#{" " * outer}"
#     end
#     height_tracker -= 1
#     break if height_tracker == (height / 2.0).round
#     outer -= outer_increment unless outer < 1
#     inner += inner_increment
#     inner_increment /= 2
#   end

#   puts "*#{" " * halves}*#{" " * halves}" + "*"

#   # loop do # right side
#   #   puts
#   # end

# end

# # sine(20, 11, 2)
# sine(51, 15, 3)


# Contributed by Kelvin Wong at Launch School
def sine_row(a, w, ith_line)
  y = ith_line.to_f

  # Given the y-coordinate of a point on the sine wave y = a*sin((2*PI/w)*x),
  # determine its x-coordinate using the inverse sine function
  x_co_ord = ((w / (2 * Math::PI)) * Math::asin(y/a)).floor

  case ith_line
  # First, puts the peak of the sine wave
  when a then ' '*x_co_ord + '*'
  # If not at the peak, then puts whitespaces, followed by *, followed by the
  # right number of whitespaces, followed by * again
  else        ' '*x_co_ord + '*' + ' '*(w/2 - x_co_ord*2 - 2) + '*'
  end
end

# Amplitude should be >= 2, and wavelength >= 6, for a shape that actually
# resembles a sine wave
def print_sine(amplitude, wavelength)
  a, w = amplitude.to_f, wavelength.to_f

  # Puts the sine wave for positive y values
  amplitude.downto(0) { |ith_line| puts sine_row(a, w, ith_line) }

  # Now puts the sine wave for negative y values, by inserting
  # (wavelength / 2) whitespace characters into each line, prior to putting
  # the wave in reverse order to above
  0.upto(amplitude) { |ith_line| puts ' '*(w / 2) + sine_row(a, w, ith_line) }
end


print_sine(5, 50)