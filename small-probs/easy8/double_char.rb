# Takes in a string
# Returns a string with all characters from original doubled.

def repeater(str, times=2)
  output = ''
  str.chars.each do |char|
    times.times {output << char}
  end
  output
end

p repeater('Hello', 3) == "HHHeeellllllooo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''
p repeater('Hi', 5) == "HHHHHiiiii"
