puts '=> Enter the length of the room in meters.'
print 'Length: '
length = gets.chomp.to_i

puts '=> Enter the width of the room in meters.'
print 'Width: '
width = gets.chomp.to_i

square_meters = length * width
square_feet = square_meters * 10.7639

puts ""
puts "The area of the room is #{square_meters} square meters, or #{square_feet} square feet."
