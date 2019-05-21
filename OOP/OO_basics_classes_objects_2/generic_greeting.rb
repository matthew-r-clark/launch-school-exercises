class Cat
  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
end

Cat.generic_greeting
kitty = Cat.new
# `kitty.class` returns the class, then calling `generic_greeting`
# on the class will operate like the above call to the same method.
kitty.class.generic_greeting