class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    @deck = Array.new
  end

  def draw
    reset if @deck.empty?
    @deck.shift
  end

  def reset
    @deck = RANKS.product(SUITS)
    .map {|rank, suit| Card.new(rank, suit)}
    .shuffle
  end
end

class Card
  attr_reader :rank, :suit
  include Comparable # must include a custom #<=> method.

  FACE_CARD_VALUES = {
    'Jack' => 11,
    'Queen' => 12,
    'King' => 13,
    'Ace' => 14
  }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def value
    FACE_CARD_VALUES.fetch(rank, rank)
  end

  def <=>(other)
    value <=> other.value
  end
end


# Tests:
deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
puts drawn.count { |card| card.rank == 5 } == 4
puts drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
puts drawn != drawn2 # Almost always.