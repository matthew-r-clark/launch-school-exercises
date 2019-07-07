class SumOfMultiples
  def initialize(*nums)
    @nums = nums
  end

  def self.to(limit, nums = [3, 5])
    (0...limit)
      .select do |digit|
        nums.any? {|num| digit % num == 0}
      end
      .reduce(:+)
  end

  def to(limit)
    self.class.to(limit, @nums)
  end
end

# p SumOfMultiples.new(3, 5).to(100)
# p SumOfMultiples.new.to(100)