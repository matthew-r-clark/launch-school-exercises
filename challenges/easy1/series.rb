class Series
  def initialize(digits)
    @digits = digits.each_char.map(&:to_i)
  end

  def slices(n)
    error = nil
    error = "Size requested (#{n}) is too large." if n > @digits.size
    error = "Size requested (#{n}) must be a positive Integer." if n <= 0
    raise ArgumentError, error if error
    @digits.each_cons(n).to_a
  end
end

series = Series.new('01234')
p series.slices(1)
p series.slices(3)
p series.slices(5)
p series.slices(7)