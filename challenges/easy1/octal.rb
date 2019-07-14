# 1) Start the decimal result at 0.
# 2) Remove the most significant octal digit (leftmost)
#    and add it to the result.
# 3) If all octal digits have been removed, stop.
# 4) Otherwise, multiply the result by 8.
# 5) Go to step 2.

class Octal
  BASE = 8
  INVALID_OCTAL = /\D|[8-9]/

  def initialize(octal)
    @octal = octal
  end

  def to_decimal
    invalid? ? 0 : calculate
  end

  private

  attr_reader :octal

  def calculate
    octal.chars.reduce(0) { |sum, digit| (sum + digit.to_i) * BASE } / BASE
  end

  def invalid?
    octal =~ INVALID_OCTAL
  end
end
