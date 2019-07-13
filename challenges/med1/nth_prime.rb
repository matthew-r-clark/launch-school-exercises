# raise ArgumentError if n is 0
# initialize prime list to [2]
# initialize current number to 3
# while primes list length is less than n:
#   add current number to primes if none of the numbers in primes list are factors
#   add 2 to current
# after while loop, return last element in primes list.


# added more tests to testing suite to test speed of calculating
# several large prime numbers. keeping the primes list stored in
# a class variable allows it to find subsequent primes faster.

class Prime
  @@primes = [2]

  def self.nth(n)
    raise ArgumentError if n == 0
    return @@primes[n-1] if @@primes.size >= n

    current = @@primes.last + 1
    current += 1 if current.even?

    while @@primes.size < n
      @@primes << current if prime?(current)
      current += 2
    end

    @@primes.last
  end

  def self.prime?(current)
    @@primes.each do |prime|
      return false if current % prime == 0
      break true if prime > Math.sqrt(current)
    end
  end
end
