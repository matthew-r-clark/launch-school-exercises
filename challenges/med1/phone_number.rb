class PhoneNumber
  attr_reader :number

  def initialize(number)
    @number = number
    process_number
  end

  def area_code
    number[0..2]
  end

  def to_s
    "(#{number[0, 3]}) #{number[3, 3]}-#{number[6, 4]}"
  end

  private

  attr_writer :number

  def process_number
    self.number = strip_non_digits unless invalid_char?
    self.number = '0000000000' unless valid?
    self.number = number[1..-1] if number.size == 11
  end

  def strip_non_digits
    number.gsub(/\D/, '')
  end

  def valid?
    /^1?\d{10}$/ =~ number
  end

  def invalid_char?
    number.match(/[a-zA-Z]/)
  end
end
