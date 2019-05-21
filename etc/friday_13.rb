# Write a method that returns the number of Friday
# the 13ths in the year given by an argument. You
# may assume that the year is greater than 1752
# (when the United Kingdom adopted the modern Gregorian
# Calendar) and that it will remain in use for the
# foreseeable future.

# Input: year (4 digit integer greater than 1752)
# Output: number of Friday 13ths in given year.

# Date.new(year, month, day)

# Integers

# Iterate through months of the year, creating a date object for
# each, then adding to 1 a counter variable if the 13th day of
# that month is a Friday. Return that counter variable.

require 'date'

def friday_13th(year)
  counter = 0

  1.upto(12) do |month|
    date = Date.new(year, month, 13)
    counter += 1 if date.friday?
  end

  counter
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2
p friday_13th(3001)