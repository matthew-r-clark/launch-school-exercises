# Create a function that, given an array of string arrays, 
# returns an array of all combinations as concatenated strings.

# The function is called with an array of arrays containing strings.
# The task is to combine each string of each array with each string 
# of each other array.
# If one of the string arrays is empty, the function will return an 
# empty array.
# The function will accept an optional second string parameter. This 
# parameter, if specified, is to be used to combine two strings.

def combinator(arr, joiner = "")
  arr = arr.map {|item| item.to_a}
  arr.each {|item| return [] if item.size == 0}

  size = 0
  arr.each {|item| size = item.size * 2 if item.size * 2 > size}
  arr = arr.map do |str|
    combined = ""
    loop do
      combined = combined + str.join(joiner)
      break if combined.size >= size
    end
    combined
  end

  output_array = []

  (arr.size*2).times {output_array << ""}
  
  (arr.size*2).times do |index|
    arr.each do |str|
      output_array[index] << str[index] << joiner
    end
  end

  # output_array.map! {|item| item.rstrip}

  output_array.sort
end


# Test cases:
p combinator([["a", "b"], ["c", "d"]])# == ["ac", "ad", "bc", "bd"]
p combinator([["a"], ["a", "b"], "a".."c"])# == ["aaa", "aab", "aac", "aba", "abb", "abc"]
# p combinator([["1"], ["2", "3"], "4".."6"])
p combinator([["foo", "bar"], ["baz", "bamboo"]], " ")# == ["foo baz", "foo bamboo", "bar baz", "bar bamboo"]
# p combinator([[]]) == []