def letter_swap(word)
  word[0],word[-1] = word[-1],word[0]
  word
end

def swap(str)
  str = str.split(' ').map{|word| letter_swap(word)}.join(' ')
end

puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'
