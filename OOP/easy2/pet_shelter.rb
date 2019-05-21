class Shelter
  def initialize(animals_list)
    @@adoptions = 0
    @@adoptors = []
    @@unadopted = animals_list
  end

  def adopt(owner, pet)
    owner.adopt(pet)
    @@adoptors << owner if !@@adoptors.include?(owner)
    @@adoptions += 1
    @@unadopted.delete(pet)
  end

  def print_adoptions
    @@adoptors.each do |adoptor|
      puts "#{adoptor.name} has adopted the following pets:"
      puts adoptor.pets
      puts
    end
  end

  def print_unadopted
    puts "The Animal Shelter has the following unadopted pets:"
    puts @@unadopted
    puts
  end
end

class Owner
  attr_accessor :pets, :name

  def initialize(name)
    @name = name
    @pets = []
  end

  def adopt(pet)
    @pets << pet.to_s
  end

  def number_of_pets
    @pets.size
  end
end

class Pet
  attr_accessor :animal_type, :name
  @@list = []

  def initialize(animal_type, name)
    @animal_type = animal_type
    @name = name
    @@list << self
  end

  def to_s
    "a #{animal_type} named #{name}"
  end

  def self.list
    @@list
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')


phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new(Pet.list) # after Pet instantiations
shelter.adopt(phanson, butterscotch)
# shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
# shelter.adopt(bholmes, chester)
# shelter.print_adoptions
shelter.print_unadopted
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."