# What is the bill? 200
# What is the tip percentage? 15
#
# The tip is $30.0
# The total is $230.0

def prompt(message)
  puts "=> #{message}"
end

bill = 0
loop do
  prompt "What is the bill?"
  bill = gets.chomp.to_f
  break if bill > 0
  prompt "Please enter a positive dollar amount."
end

perc = 0
loop do
  prompt "What is the tip percentage?"
  perc = gets.chomp.to_f / 100
  break if perc > 0 && perc <= 100
  prompt "Please enter a valid percentage between 0 and 100."
end

tip = bill * perc
total = bill + tip

prompt "The tip is $#{sprintf "%.2f", tip}."
prompt "The total is $#{sprintf "%.2f", total}."
