# Takes in a String, returns true if all alphabetic characters are uppercase.

# Iterate through characters, if a letter check if uppercase.

ALPHA = ('a'..'z').to_a

def uppercase?(str)
  str.chars.each {|char| return false if ALPHA.include?(char)}
  true

  # LS solution:
  # string == string.upcase
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true
