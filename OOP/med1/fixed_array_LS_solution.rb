# No need to inherit from Array class, you can utilize array
# methods using a collaborator object (an array intsance var)

class FixedArray
  def initialize(size)
    @array = Array.new(size) # Utilize collaborator object instantiation
  end

  def to_s
    to_a.to_s
  end

  def []=(index, element)
    self[index] # will raise error if doesn't already exist
    @array[index] = element
  end

  def [](index)
    @array.fetch(index) # using #fetch will give index error
  end

  def to_a
    @array.clone # Prevents array from being mutated outside of class.
  end
end

# Tests
fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'

begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[7] = 3
  puts false
rescue IndexError
  puts true
end

puts
fixed_array[0] = 'hello'
puts "Testing 'fixed_array.[]=()' and 'fixed_array.[]()' methods:"
puts "Checking value at index 0"
puts "=> " + fixed_array.[](0)
puts "Changing value at index 0 to 'goodbye'"
fixed_array.[]=(0, 'goodbye')
puts "=> " + fixed_array.[](0)
puts "Checking value at index 0 again"