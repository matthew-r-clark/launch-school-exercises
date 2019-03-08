# Takes in a string of words.
# Returns the second to last word.

def penultimate(message)
  message.split[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'


def middle_word(message)
  words = message.split
  index = words.size / 2
  index -= 1 if words.size.even?
  words[index]
end

p middle_word('Launch School is great!') == 'School'
p middle_word('Launch School is great and I love it!') == 'great'
p middle_word('Some dogs are big and some are small') == 'big'
p middle_word('Coding is fun') == 'is'
p middle_word('Hello') == 'Hello'
