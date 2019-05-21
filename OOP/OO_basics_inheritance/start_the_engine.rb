class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end

  def start_engine
    puts "Super! Let's do it!"
  end
end

class Truck < Vehicle
  def initialize(year)
    super
    start_engine
  end

  def start_engine
    puts 'Ready to go!'
    super
  end
end

truck1 = Truck.new(1994)
puts truck1.year
