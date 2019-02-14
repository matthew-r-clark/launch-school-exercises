# What is your age? 30
# At what age would you like to retire? 70
#
# It's 2016. You will retire in 2056.
# You have only 40 years of work to go!

date = Time.new()

def prompt(message)
  puts "=> #{message}"
end

age = nil
loop do
  prompt "What is your age?"
  age = gets.chomp.to_i
  break if age > 0
  prompt "Please enter a positive number."
end

retire = nil
loop do
  prompt "At what age would you like to retire?"
  retire = gets.chomp.to_i
  break if retire > age
  prompt "Please enter a number greater than your age."
end

retire_in = retire - age

prompt "It's #{date.year}. You will retire in #{date.year + retire_in}."
prompt "You have only #{retire_in} years left to go!"
