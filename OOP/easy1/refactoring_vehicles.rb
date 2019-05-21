class Vehicle
  attr_reader :make, :model, :wheels

  def initialize(make, model)
    @make = make
    @model = model
  end

  def to_s
    "A #{make} #{model} #{self.class}"
  end
end

class Car < Vehicle
  def initialize(make, model)
    super
    @wheels = 4
  end
end

class Motorcycle < Vehicle
  def initialize(make, model)
    super
    @wheels = 2
  end
end

class Truck < Vehicle
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
    @wheels = 6
  end
end


# Tests
car = Car.new('Toyota', 'Corolla')
bike = Motorcycle.new('Honda', 'Shadow')
truck = Truck.new('Chevrolet', '3500', '2000lbs')

puts car
puts bike
puts truck

puts car.wheels
puts bike.wheels
puts truck.wheels
puts truck.payload