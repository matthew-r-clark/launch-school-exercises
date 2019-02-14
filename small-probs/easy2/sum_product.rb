def prompt(message)
  puts "=> #{message}"
end

def compute_sum(num)
  (1..num).reduce(:+)
end

def compute_product(num)
  (1..num).reduce(:*)
end

prompt "Enter an integer greater than 0."
number = nil
loop do
  number = gets.chomp.to_i
  break if number > 0
  prompt "Please enter an integer greater than 0."
end

prompt "Enter 's' to compute the sum of all numbers from 1 to #{number}."
prompt "Enter 'p' to compute the product of all numbers from 1 to #{number}."
operation = nil
loop do
  operation = gets.chomp.downcase
  break if operation == 's' || operation == 'p'
  prompt "Please enter either an 's' or a 'p'."
end

operation_name = nil
result = nil
if operation == 's'
  operation_name = 'sum'
  result = compute_sum(number)
elsif operation == 'p'
  operation_name = 'product'
  result = compute_product(number)
end

prompt("The #{operation_name} of all the integers between 1 and #{number} " \
  "is #{result}")
