module Walkable
  def initialize(feet)
    @feet = feet
    puts "Your #{self.class} has #{feet} feet."
  end
end

class Man
  include Walkable

  attr_accessor :feet
end

dude = Man.new(2)
p dude.feet
p dude