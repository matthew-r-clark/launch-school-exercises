def stringy(num, start = 1)
  # my solution, before start was added
  # str = ''
  # num.times do |i|
  #   i % 2 == 0 ? str << '1' : str << '0'
  # end
  # str

  # launch school solution, with added start functionality
  numbers = []
  num.times do |i|
    if start == 1
      number = i.even? ? 1 : 0
    else
      number = i.odd? ? 1 : 0
    end
    numbers << number
  end
  numbers.join
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
puts stringy(7, 0) == '0101010'
