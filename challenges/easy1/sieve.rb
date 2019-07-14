class Sieve
  def initialize(limit)
    @limit = limit
  end

  def primes
    range = (2..@limit).each_with_object({}) { |e, h| h[e] = nil }
    range.each do |key, val|
      next unless val.nil?
      range[key] = :prime
      (key + 1..@limit).each { |e| range[e] = :not_prime if e % key == 0 }
    end
    range.select { |_, v| v == :prime }.map { |k, _| k }
  end
end
