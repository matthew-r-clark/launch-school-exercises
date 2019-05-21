class Transform
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def uppercase
    text.upcase
  end

  def self.lowercase(text)
    text.downcase
  end
end


# Write a class that will display:
# ABC
# xyz

# when the following code is run:
my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')