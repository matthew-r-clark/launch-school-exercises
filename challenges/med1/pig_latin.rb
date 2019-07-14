class PigLatin
  CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x y z)

  def self.translate(words)
    words.split.map do |word|
      translate_word(word)
    end.join(' ')
  end

  def self.translate_word(word)
    if begins_with_consonant_sound?(word)
      word = shift_beginning(word) unless exception?(word)
    end

    word + 'ay'
  end

  def self.shift_beginning(word)
    while begins_with_consonant_sound?(word) || word[-1] == 'q'
      word = word[1..-1] + word[0]
    end
    word
  end

  def self.begins_with_consonant_sound?(word)
    CONSONANTS.include?(word[0].downcase)
  end

  def self.exception?(word)
    case word[0..1]
    when 'xr' then true
    when 'yt' then true
    else false
    end
  end
end
