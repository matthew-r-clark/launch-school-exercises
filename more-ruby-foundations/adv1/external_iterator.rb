factorials = Enumerator.new do |collection|
  iteration = 0
  current = 1
  loop do
    collection << current
    iteration += 1
    current *= iteration
  end
end

# puts factorials.take(7)

7.times { puts factorials.next }

factorials.rewind

factorials.each_with_index do |num, i|
  puts num
  break if i == 3
end