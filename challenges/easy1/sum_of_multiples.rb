class SumOfMultiples
  def initialize(*nums)
    @nums = nums
  end

  def self.to(limit, nums = [3, 5])
    (0...limit)
      .select do |digit|
        nums.any? { |num| digit % num == 0 }
      end
      .reduce(:+)
  end

  def to(limit)
    self.class.to(limit, @nums)
  end
end
