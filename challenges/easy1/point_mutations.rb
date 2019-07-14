class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(strand2)
    @strand.chars.zip(strand2.chars)  # zip arrays to compare each letter pair
           .map(&:compact)            # remove nil values when lengths differ
           .map(&:uniq)               # isolate letter pairs that don't match
           .count { |e| e.size == 2 } # count mismatched letter pairs
  end
end
