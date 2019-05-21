# Write code that allows you to determine the greater
# common divisor of two numbers

def gcd(a, b)
  # always consider that a > b
  b.downto(1) do |num|
    if b % num == 0
      return num if a % num == 0
    end
  end
end

# Try to write a recursive version

p gcd(18, 35) #== 1
p gcd(28851538, 1183019) #== 17657
p gcd(35, 14) #== 7