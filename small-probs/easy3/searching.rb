def prompt(message)
  puts "=> #{message}"
end

def ordinalize(num)
  if num == 1
    result = "#{num}st"
  elsif num == 2
    result = "#{num}nd"
  elsif num == 3
    result = "#{num}rd"
  else
    result = "#{num}th"
  end
  result
end

def search(num, arr)
  if arr.include?(num)
    'appears'
  else
    'does not appear'
  end
end

list = []
5.times do |num|
  prompt "Enter the #{ordinalize(num + 1)} number:"
  list << gets.chomp.to_i
end

prompt "Enter the last number:"
last = gets.chomp.to_i

puts "The number #{last} #{search(last, list)} in #{list}."
