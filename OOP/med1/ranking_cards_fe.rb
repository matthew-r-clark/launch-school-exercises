class Card
  attr_reader :rank, :suit
  include Comparable # must include a custom #<=> method.

  FACE_CARD_VALUES = {
    'Jack' => 11,
    'Queen' => 12,
    'King' => 13,
    'Ace' => 14
  }

  SUIT_VALUES = {
    'Spades' => 3,
    'Hearts' => 2,
    'Clubs' => 1,
    'Diamonds' => 0
  }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def value
    (FACE_CARD_VALUES.fetch(rank, rank)*5) + SUIT_VALUES.fetch(suit)
  end

  def <=>(other)
    value <=> other.value
  end
end

# Tests
cards = [Card.new('Ace', 'Spades'),
         Card.new('Ace', 'Diamonds'),
         Card.new('Ace', 'Clubs'),
         Card.new('Ace', 'Hearts'),
         Card.new('King', 'Hearts'),
         Card.new('Queen', 'Hearts'),
         Card.new('Queen', 'Spades'),
         Card.new(4, 'Hearts'),
         Card.new(2, 'Hearts'),
         Card.new(3, 'Spades'),
         Card.new(2, 'Spades'),
         Card.new(5, 'Clubs')]
puts cards
puts
puts cards.min == Card.new(2, 'Hearts')
puts cards.max == Card.new('Ace', 'Spades')
puts
puts cards.sort