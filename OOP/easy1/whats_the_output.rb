class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

name = 'Fluffy' # initializes local variable `name` => "Fluffy"
fluffy = Pet.new(name) # initializes new Pet object, fluffy,
                       # using the name variable set to "Fluffy"
puts fluffy.name # => Fluffy
puts fluffy      # => My name is FLUFFY.
puts fluffy.name # => FLUFFY
puts name        # => FLUFFY

puts
puts "Further Exploration:"
# Further Exploration:
name = 42 # initialize local variable name to Integer value 42
fluffy = Pet.new(name) # instantiate Pet object ref by fluffy var,
# set name of fluffy to String value, "42"
name += 1 # increase local var `name` by 1, now is 43
puts fluffy.name # => 42
puts fluffy      # => My name is 42. - upcase doesn't affect digits
puts fluffy.name # => 42 
puts name        # => 43

# Even if method was mutating, it wouldn't affect this output
# because the instance variable @name is no longer referencing
# the same object as the local variable name since it was
# converted to a String.