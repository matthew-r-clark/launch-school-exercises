# Initialize a counter to 0
# Iterate through every character in string
# Increase counter by 1 each time a '(' is encountered
# Decrease counter by 1 each time a ')' is encountered
# If counter ever is less than 0, return false
# If counter is greater than 0 after iteration, return false
# Otherwise return true

def balanced?(str)
  parentheses = 0
  square_brackets = 0
  curly_brackets = 0
  double_quotes = 0
  single_quotes = 0

  str.each_char do |char|
    case char
    when "(" then parentheses += 1
    when ")" then parentheses -= 1
    when "[" then square_brackets += 1
    when "]" then square_brackets -= 1
    when "{" then curly_brackets += 1
    when "}" then curly_brackets -= 1
    when "\""
      if double_quotes == 0
        double_quotes += 1
      else
        double_quotes -= 1
      end
    when "'"
      if single_quotes == 0
        single_quotes += 1
      else
        single_quotes -= 1
      end
    end
    return false if parentheses < 0 || square_brackets < 0 || curly_brackets < 0
  end
  parentheses == 0 && square_brackets == 0 && curly_brackets == 0 &&
  double_quotes == 0 && single_quotes == 0
end

p balanced?('Wh{at (i[s)} this]?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?('[the]eres [some] bracker[ts] here') == true
p balanced?('thes[bark] ets ain]t matched') == false
p balanced?('aginat{{matched entierh}}{') == false
p balanced?('{thems { are tho}}yep') == true
p balanced?('Here are (some) \"double quotes\"') == true
p balanced?('\"unmatched doubles\" do you like\"?') == false
p balanced?('\'some single quotes\'') == true
p balanced?('\'these\'re some unmatched singles\'') == false