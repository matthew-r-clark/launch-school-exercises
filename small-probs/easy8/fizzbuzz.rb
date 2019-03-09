# Changing these variables may result in code shaming, but I had to play
# around with them to better understand the mechanics of IO#print.
$, = ", "
$\ = "\n"

def fizzbuzz(start, stop)
  output = []
  start.upto(stop) do |num|
    output << find_value(num)
  end
  print(*output)
end

def find_value(num)
  case
  when num % 3 == 0 && num % 5 == 0
    "FizzBuzz"
  when num % 3 == 0
    "Fizz"
  when num % 5 == 0
    "Buzz"
  else
    num
  end
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8,
# Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
