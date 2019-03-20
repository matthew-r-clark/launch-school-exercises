
# array = [value, first_index, last_index, quantity]



def find_repeating(s)
  groups = []
  current_word = ""
	s.each_char do |char|
    if current_word.include?(char) || current_word == ""
      current_word << char
    else
      groups << current_word
      current_word = char
    end
  end
  groups << current_word

  

  output_array = []
  index = 0
  groups.each do |word|
    size = word.size
    output_array << [word[0], index, index + size - 1, size]
    index += size
  end
  output_array
end

p find_repeating("a") == [["a", 0, 0, 1]]
p find_repeating("aabbb") == [["a", 0, 1, 2], ["b", 2, 4, 3]]
p find_repeating("1337") == [["1", 0, 0, 1], ["3", 1, 2, 2], ["7", 3, 3, 1]]
p find_repeating("aabbbaabbb") == [["a", 0, 1, 2], ["b", 2, 4, 3], ["a", 5, 6, 2], ["b", 7, 9, 3]]
