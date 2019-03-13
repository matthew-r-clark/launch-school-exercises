# Takes in a string of words, separated by one space.
# Returns an array of each word, plus a space and the size of that word
# as a single string, for each word in the original string.

# Iterate through each word and add space and size.
# Convert to an array of words, map through replacing values

def word_lengths(str)
  str.split.map { |word| "#{word} #{word.size}" }
end

p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []
