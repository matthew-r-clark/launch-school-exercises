# using substring.rb method, iterate through start/stop indices to get all substrings.

def substring(str, start, stop=start)
  str[start..stop]
end

def all_substrings(str)
  output = []
  #outer loop defines start_index: 0..(str.size-2)
  start_index = 0
  while start_index < str.size - 1
    #inner loop defines stop_index: (start_index+1)..(str.size-1)
    stop_index = start_index + 1
    while stop_index < str.size
      output << substring(str, start_index, stop_index)
      stop_index += 1
    end

    start_index += 1
  end
  output
end

# p all_substrings("band") #== ['ba', 'ban', 'band', 'an', 'and', 'nd']
# p all_substrings("world")
# p all_substrings("ppop")

def palindromes(str)
  all_substrings(str).select {|element| element == element.reverse}
end

# p palindromes("mississippi")
# p palindromes("world")
# p palindromes("ppop")

def largest_palindrome(str)
  largest = palindromes(str).max
  largest ? largest : false
end

p largest_palindrome("mississippi")
p largest_palindrome("world")
p largest_palindrome("ppop")