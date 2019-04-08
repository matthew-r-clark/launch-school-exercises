WORDS = {
  "VERB" => [
  'accept', 'achieve', 'act', 'bleed', 'decide', 'detroy',
  'dust', 'explain', 'explore', 'fly', 'live', 'observe'
  ],
  "ADVERB" => [
    'massively', 'carefully', 'creatively', 'powerfully',
    'enviously', 'firmly', 'insultingly', 'quickly', 'badly'
  ],
  "NOUN" => [
    'advice', 'blood', 'breath', 'cure', 'clarity', 'dust',
    'glory', 'moisture', 'pleasure', 'hope', 'love', 'food'
  ],
  "ADJECTIVE" => [
    'amazing', 'boring', 'challenging', 'crazy', 'demanding',
    'fascinating', 'instructive', 'lively', 'bad', 'scenic'
  ]
}

# ADJECTIVES = %w(quick lazy sleepy ugly).freeze
# NOUNS      = %w(fox dog head leg cat tail).freeze
# VERBS      = %w(spins bites licks hurdles).freeze
# ADVERBS    = %w(easily lazily noisly excitedly).freeze

def madlib(filename)
  text = ""
  File.open(filename).each {|line| text << line}
  text = text.gsub("\n", " ")

  text.split.map do |word|
    punctuation = ""

    if word[-1] =~ /[.,!?:;]/
      punctuation = word[-1]
      word = word[0..-2]
    end

    if WORDS.keys.include?(word)
      WORDS[word].sample + punctuation
    else
      word + punctuation
    end
  end.join(" ")
end

def madlib2(filename)
  File.open(filename).each do |line|
    puts format(line, noun:      WORDS['NOUN'].sample,
                      adjective: WORDS['ADJECTIVE'].sample,
                      verb:      WORDS['VERB'].sample,
                      adverb:    WORDS['ADVERB'].sample)
  end
end

# p madlib("madlibs.txt")
madlib2("madlibs2.txt")