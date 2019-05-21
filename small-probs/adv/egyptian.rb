def egyptian(rat)
  denominators = []

  for i in (1..)
    if rat - Rational(1, i) >= 0
      denominators << i
      rat -= Rational(1, i)
    else
      next
    end
    break if rat == 0
  end

  denominators
end

def add_denominators(denominators)
  denominators.reduce(0) {|sum, denom| sum + Rational(1, denom)}
end

def unegyptian(denominators)
  add_denominators(denominators)
end

p egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
p egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
p egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]
p egyptian(Rational(3, 4))    # -> [2, 4]

p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)