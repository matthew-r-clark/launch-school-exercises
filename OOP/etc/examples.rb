class Person
  include Comparable
  attr_accessor :first_name, :last_name

  def initialize(name)
    self.name=(name)
  end
  
  def name
    "#{first_name} #{last_name}".strip
  end
  
  def name=(name)
    name = name.split
    @first_name = name.first
    @last_name = name.size > 1 ? name.last : ""
  end
  
  def <=>(other)
    name <=> other.name
  end
  
  def to_s
    name
  end
end



bob = Person.new('Robert Smith')
matt = Person.new('Robert Smith')

puts bob == matt
puts bob.name == matt.name
puts "The person's name is #{bob}."
