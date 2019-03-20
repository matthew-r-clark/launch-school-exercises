# Asks user for an integer greater than 0
# Then asks user if the want the sum or product of all
# integers between 1 and the number provided.

def prompt(message)
  puts "==> #{message}"
end

def product(num)
  (1..num).reduce(:*)
end

def sum(num)
  (1..num).reduce(:+)
end

prompt "Please enter an Integer greater than 0:"
number = nil
loop do
  number = gets.chomp.to_i
  break if number > 0
  prompt "Please enter a valid Integer greater than 0:"
end

prompt "Enter 's' to compute the sum, 'p' to compute the product."
operator = nil
loop do
  operator = gets.chomp
  break if operator == 'p' || operator == 's'
  prompt "Please enter valid input, a 'p' or an 's'."
end

if operator == 's'
  result = sum(number)
  operator = 'sum'
elsif operator == 'p'
  result = product(number)
  operator = 'product'
end

puts
prompt "The #{operator} of the Integers between 1 and #{number} is #{result}."