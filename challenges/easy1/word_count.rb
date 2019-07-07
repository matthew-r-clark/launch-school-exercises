require 'pry'
system 'clear'

class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    # # original solution:
    # @phrase.downcase.gsub(/(\s\W|\W\s|\W{2,}|[,.])/, ' ')
    #   .split.group_by(&:itself)
    #   .map {|key, val| [key, val.count]}.to_h

    # incorporating others' solutions and possessive words ending in 's'
    word_hash = Hash.new(0)
    @phrase.scan(/'?\b[\w']+\b'?/) do |word|
      word = word[1..-2] if word.match?(/'.+'/)
      word_hash[word.downcase] += 1
    end
    word_hash
  end
end

# test cases:

# phrase1 = Phrase.new('car : carpet as java : javascript!!&@$%^&')
# phrase2 = Phrase.new('one,two,three')
# phrase3 = Phrase.new("one,\ntwo,\nthree")
# phrase4 = Phrase.new('testing, 1, 2 testing')
# phrase5 = Phrase.new("Joe can't tell between 'large' and large.")
# # testing for trailing possessive apostrophe:
# phrase6 = Phrase.new("Jesus' love conquors all things.")

# p phrase1.word_count
# p phrase2.word_count
# p phrase3.word_count
# p phrase4.word_count
# p phrase5.word_count
# p phrase6.word_count