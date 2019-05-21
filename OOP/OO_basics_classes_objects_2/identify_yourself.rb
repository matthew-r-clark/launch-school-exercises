class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def identify
    self
  end
end

kitty = Cat.new('Sophie')
# calls #inspect; prints object w/ instance vars and their values
p kitty.identify
# calls #to_s; only prints the object
puts kitty.identify