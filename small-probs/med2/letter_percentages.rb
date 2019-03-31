# initialize hash
# compute perc of lowercase, store in hash
# compute perc of uppercase, store in hash
# set neither key to (100 - lowercase - uppercase)
# return hash

def letter_percentages(str)
  percentages = {}
  upper = str.chars.select {|char| char =~ /[a-z]/}.size / str.size.to_f * 100
  lower = str.chars.select {|char| char =~ /[A-Z]/}.size / str.size.to_f * 100

  percentages[:lowercase] = upper.round(2)
  percentages[:uppercase] = lower.round(2)
  percentages[:neither] = (100 - percentages[:lowercase] - percentages[:uppercase]).round(2)

  percentages
end

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
p letter_percentages('Hello World! It\'s a great day! What do you think?')
p letter_percentages('abcdefGHI')