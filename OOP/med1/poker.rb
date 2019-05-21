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

# Create a class, PokerHand, that takes 5 cards from a
# Deck of Cards and evaluates those cards as a Poker hand.
class PokerHand
  def initialize(deck)
    @hand = []
    5.times {@hand << deck.draw}
  end

  def print
    puts @hand
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def royal_flush? # A, K, Q, J, 10, all the same suit.
    @hand.group_by {|card| card.suit}.keys.size == 1 &&
    @hand.map {|card| card.value}.sort == [10, 11, 12, 13, 14]
  end

  def straight_flush? # Five cards in a sequence, all in the same suit.
    @hand.group_by {|card| card.suit}.keys.size == 1 && straight?
  end

  def four_of_a_kind? # All four cards of the same rank.
    of_a_kind?(4)
  end

  def full_house? # Three of a kind with a pair. 
    @hand.map {|card| card.rank}
    .group_by(&:itself).values
    .map {|group| group.size}.sort == [2,3]
  end

  def flush? # Any five cards of the same suit, but not in a sequence.
    @hand.map {|card| card.suit}.uniq.size == 1
  end

  def straight? # Five cards in a sequence, but not of the same suit.
    value_adjuster = @hand.min.value - 1
    @hand.map {|card| card.value - value_adjuster}.sort == (1..5).to_a
  end

  def three_of_a_kind? # Three cards of the same rank.
    of_a_kind?(3)
  end

  def two_pair? # Two different pairs.
    @hand.map {|card| card.rank}
    .group_by(&:itself).values
    .map {|group| group.size}
    .select {|item| item == 2}
    .size == 2
  end

  def pair? # Two cards of the same rank.
    of_a_kind?(2)
  end

  def of_a_kind?(num)
    @hand.map {|card| card.rank}
    .group_by(&:itself).values
    .map {|group| group.size}.max == num
  end
end


# Tests:  ====================================
hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate
puts

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'