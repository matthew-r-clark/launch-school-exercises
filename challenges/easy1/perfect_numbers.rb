class PerfectNumber
  def self.classify(num)
    raise RuntimeError if num < 1
    return 'perfect' if sum_of_factors(num) == num
    return 'abundant' if sum_of_factors(num) > num
    return 'deficient' if sum_of_factors(num) < num
  end

  def self.sum_of_factors(num)
    (1...num).select { |n| n if num % n == 0 }.reduce(:+)
  end
end
