class Translation
  AMINOS = {
    AUG: "Methionine", UUU: "Phenylalanine", UUC: "Phenylalanine",
    UUA: "Leucine", UUG: "Leucine", UCU: "Serine", UCC: "Serine",
    UCA: "Serine", UCG: "Serine", UAU: "Tyrosine", UAC: "Tyrosine",
    UGU: "Cysteine", UGC: "Cysteine", UGG: "Tryptophan",
    UAA: "STOP", UAG: "STOP", UGA: "STOP"
  }

  def self.of_codon(codon)
    AMINOS.fetch(codon.to_sym) { raise InvalidCodonError }
  end

  def self.of_rna(strand)
    strand.scan(/.../)
          .take_while { |codon| of_codon(codon) != "STOP" }
          .map { |codon| of_codon(codon) }
  end
end

class InvalidCodonError < StandardError; end
