class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    word_hash = Hash.new(0)
    @phrase.scan(/'?\b[\w']+\b'?/) do |word|
      word = word[1..-2] if word.match?(/'.+'/)
      word_hash[word.downcase] += 1
    end
    word_hash
  end
end
