# case doesn't matter
# don't include the exact same word in returned list

class Anagram
  def initialize(word)
    @word = word
  end

  def match(list)
    list.select { |word| anagram?(word) }
  end

  private

  def same?(word)
    word.downcase == @word.downcase
  end

  def anagram?(word)
    !same?(word) && sorted(word) == sorted(@word)
  end

  def sorted(word)
    word.downcase.chars.sort.join
  end
end