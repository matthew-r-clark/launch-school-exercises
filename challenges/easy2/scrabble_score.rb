class Scrabble
  def initialize(word)
    @word = word
  end

  def score
    score = 0
    return score unless valid?
    @word.upcase.each_char do |char|
      score += letter_value(char)
    end
    score
  end

  def valid?
    String === @word
  end

  def letter_value(char)
    case
    when %w(A E I O U L N R S T).include?(char) then 1
    when %w(D G).include?(char)                 then 2
    when %w(B C M P).include?(char)             then 3
    when %w(F H V W Y).include?(char)           then 4
    when %w(K).include?(char)                   then 5
    when %w(J X).include?(char)                 then 8
    when %w(Q Z).include?(char)                 then 10
    else                                             0
    end
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end

# p Scrabble.new('he').score