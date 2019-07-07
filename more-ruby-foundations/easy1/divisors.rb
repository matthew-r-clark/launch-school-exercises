# def divisors(num)
#   divs = []
#   (1..num).each do |n|
#     divs << n if num % n == 0
#   end
#   divs
# end

# def divisors(num)
#   (1..num).select {|n| num % n == 0}
# end

# further exploration
def divisors(num)
  raise TypeError, "Must be Integer." unless Integer === num
  current = 1
  divs = [current]
  target = num

  # modified solution from Ido
  while current < target
    divs.concat([current, num / current]) if num % current == 0
    target = (num / current)
    current += 1
  end

  divs.uniq.sort
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891]
p divisors(999962000357) == [1, 999979, 999983, 999962000357]
p divisors(1.5)