class Trinary
  BASE = 3
  INVALID_TRINARY = /\D|[3-9]/

  def initialize(trinary)
    @trinary = trinary
  end

  def to_decimal
    invalid? ? 0 : calculate
  end

  private

  attr_reader :trinary

  def calculate
    trinary.chars.reduce(0) { |sum, digit| (sum + digit.to_i) * BASE } / BASE
  end

  def invalid?
    trinary =~ INVALID_TRINARY
  end
end
