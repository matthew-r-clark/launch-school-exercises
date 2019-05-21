
# def fibonacci(n)
#   if n == 1 || n == 2
#     1
#   else
#     fibonacci(n-1) + fibonacci(n-2)
#   end
# end

# def fibonacci_tail(nth, acc1, acc2)
#   if nth == 1
#     acc1
#   elsif nth == 2
#     acc2
#   else
#     fibonacci_tail(nth - 1, acc2, acc2 + acc1)
#   end
# end

# def fibonacci(nth)
#   fibonacci_tail(nth, 1, 1)
# end

# From LS student Nayib Abdala
def fibonacci(n)
  n < 2 ? n : fibonacci(n - 1) + fibonacci(n - 2)
end 


p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765
# p fibonacci(800)