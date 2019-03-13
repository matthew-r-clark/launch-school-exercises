# Takes in a String and returns a new String in which only consonants
# are doubled.

CONSONANTS = 'bcdfghjklmnpqrstvwxyz'.chars

def double_consonants(str)
  str.chars.map { |char| repeat?(char) ? repeater(char) : char }.join
end

def repeat?(char)
  CONSONANTS.include?(char.downcase)
end

def repeater(char)
  char * 2
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
