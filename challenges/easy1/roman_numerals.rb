class Integer
  NUMERALS = {
    1 => ['I', 'V'], # ones
    2 => ['X', 'L'], # tens
    3 => ['C', 'D'], # hundreds
    4 => ['M']       # thousands
  }

  def to_roman
    result = ''
    digit_separation.reverse.select { |n| n > 0 }
                    .each do |num|
                      result += compute(num)
                    end

    result
  end

  def digit_separation
    zeros = -1
    self.digits.map do |digit|
      zeros += 1
      (digit.to_s + ("0" * zeros)).to_i
    end
  end

  def compute(num)
    pattern = ''
    digit = num.digits.last
    place = num.to_s.size

    one, five = NUMERALS[place]
    pattern += if digit <= 3 || place == 4
                 one * digit
               elsif digit == 4
                 one + five
               elsif digit < 9
                 five + (one * (digit - 5))
               else
                 one + NUMERALS[place + 1].first
               end

    pattern
  end
end
