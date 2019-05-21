class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new('Black')
# Lookup path will be: [Cat, Animal]
# stops at Animal because that's where it finds the method.
p cat1.color
p Cat.ancestors