# Find the index (start with 1) of the first number in the Fibonacci sequence
# that has the number of digits passed in as an argument.

# Data structure: generate fib values in array, check each new value to see
# if it has the required number of digits, return array size.

# Calculate Fibonacci sequence UNTIL a number has the necessary number of digits.

def find_fibonacci_index_by_length(digits)
  sequence = [1, 1]
  loop do
    n = sequence[-1] + sequence[-2]
    sequence << n
    break if n.to_s.size == digits
  end
  sequence.size
end

puts find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
puts find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
puts find_fibonacci_index_by_length(10) == 45
puts find_fibonacci_index_by_length(100) == 476
puts find_fibonacci_index_by_length(1000) == 4782
puts find_fibonacci_index_by_length(10000) == 47847
