def count_occurrences(ary)
  result = {}
  ary.each do |elem|
    elem.downcase!
    result.include?(elem) ? result[elem] += 1 : result[elem] = 1
  end
  result.each do |k,v|
    puts "#{k} => #{v}"
  end
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck', 'suv'
]

count_occurrences(vehicles)
