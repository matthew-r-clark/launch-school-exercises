class Luhn
  def initialize(number)
    @number = number
  end

  def addends
    # returns list of digits after conversion
    @number.digits.map.with_index do |digit, index|
      if index.odd?
        digit *= 2
        digit -= 9 if digit >= 10
      end
      digit
    end.reverse
  end

  def checksum
    addends.reduce(:+)
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(number)
    # append 0 to addends
    sample_num = Luhn.new(append_digit(number, 0))

    # check digit is (10 - (checksum % 10))
    check_digit = ((sample_num.checksum % 10) - 10).abs

    # adjust for an already valid number
    check_digit = 0 if check_digit == 10

    # return new number
    append_digit(number, check_digit)
  end

  def self.append_digit(original, additive)
    (original.to_s + additive.to_s).to_i
  end
end