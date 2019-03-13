# Takes in a String
# Returns the middle character(s) of the argument

def center_of(str)
  index = str.size / 2
  middle = str[index]
  middle = str[index-1] + middle if str.size.even?
  middle
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
