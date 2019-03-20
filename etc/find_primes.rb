def find_primes(start, stop)
  (start..stop).select {|e| is_prime?(e)}
end

def is_prime?(num)
  (2...num).each { |e| return false if num % e == 0 }
  true
end

p find_primes(3,10)
p find_primes(4,20)