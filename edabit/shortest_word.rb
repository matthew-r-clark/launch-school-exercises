# Takes in a string of words.
# Finds the shortest word or words.
# Outputs an array of word, or if multiple shortest words, outputs all
# sorted in alphabetical order within the array.
# All words in new array are lowercase.
# Non letters and non numbers aren't counted in word length.

# Separate the string into an array of words, downcase each word
# Get rid of any special characters
# Iterate through array of words, checking for shortest words
#   If current shortest word length is greater than current word,
#   purge array and start a new one.
# Sort and return array

def find_shortest_words(str)
  words = str.downcase.split(/[^a-z0-9]/)
  words = words.sort_by {|word| word.size}
  shortest = []

  words = words.select {|word| word.size > 0}

  size = words[0].size
  words.each do |word|
    break if word.size > size
    shortest << word
  end
  shortest.sort
end

p find_shortest_words("The quick brown fox jumped over the lazy dogs back.") == ["fox", "the", "the"]
p find_shortest_words("I think the solution is fairly obvious.") == ["i"]
p find_shortest_words("Chase two rabbits, catch none.") == ["two"]
p find_shortest_words("We become what we think about.") == ["we", "we"]


split into strings of repeated characters
create a cursor to follow through the original string
