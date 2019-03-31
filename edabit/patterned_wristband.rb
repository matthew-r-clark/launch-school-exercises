# p is_wristband(
# [['A', 'B', 'C'],
# ['C', 'A', 'B'],
# ['B', 'C', 'A'],
# ['A', 'B', 'C']]) #== true (diag left)

# [' ', ' ', ' ', 'A', 'B', 'C']
# [' ', ' ', 'C', 'A', 'B', ' ']
# [' ', 'B', 'C', 'A', ' ', ' ']
# ['A', 'B', 'C', ' ', ' ', ' ']

# map, add nil values to beg/end using counters
# transpose, strip nils, pass to horizontal? -- doesn't work

def array_copy(arr)
  arr.map do |subarr|
    subarr.map {|element| element += ""}
  end
end

def vertical?(band)
  horizontal?(band.transpose)
end

def horizontal?(band)
  band.each { |element| return false unless element.uniq.size == 1 }
  true
end

def diag_right?(band)
  right = band.size - 1
  left = 0
  band = band.map do |element|
    element.unshift([nil] * left)
    element.push([nil] * right)
    left += 1
    right -= 1
    element.flatten
  end
  band = band.transpose.map(&:compact)
  horizontal?(band)
end

def diag_left?(band)
  left = band.size - 1
  right = 0
  band = band.map do |element|
    element.unshift([nil] * left)
    element.push([nil] * right)
    left -= 1
    right += 1
    element.flatten
  end
  band = band.transpose.map(&:compact)
  horizontal?(band)
end

def is_wristband(band)
  horizontal?(band) || vertical?(band) ||
  diag_right?(array_copy(band)) || diag_left?(band)
end


p is_wristband( 
[['A', 'A'], 
['B', 'B'], 
['C', 'C']]) == true #(horizontal)

p is_wristband(
[['A', 'B'], 
['A', 'B'], 
['A', 'B']]) == true #(vertical)

p is_wristband(
[['A', 'B', 'C'],
['C', 'A', 'B'],
['B', 'C', 'A'],
['A', 'B', 'C']]) == true #(diag left)

p is_wristband(
[['A', 'B', 'C'], 
['B', 'C', 'A'], 
['C', 'A', 'B'], 
['A', 'B', 'A']]) == true #(diag right)

p is_wristband(
[['A', 'B', 'C'], 
['C', 'A', 'B'], 
['D', 'C', 'A'], 
['E', 'D', 'C']]) == true

p is_wristband(
[['A', 'B', 'C'], 
['B', 'A', 'B'], 
['D', 'C', 'A'], 
['E', 'D', 'C']]) == false

p is_wristband(
[['A', 'B', 'C'], 
['B', 'C', 'D'], 
['C', 'D', 'E'], 
['D', 'E', 'F']]) == true

p is_wristband(
[['A', 'B', 'C'], 
['B', 'C', 'D'], 
['C', 'D', 'E'], 
['D', 'E', 'E']]) == true

p is_wristband(
[['A', 'B', 'C'], 
['B', 'C', 'D'], 
['C', 'D', 'E'], 
['D', 'F', 'E']]) == false

p is_wristband(
[['A', 'B', 'C'], 
['B', 'D', 'A'], 
['C', 'A', 'B'], 
['A', 'B', 'A']]) == false

p is_wristband(
[['A', 'B'],  
['A', 'B'], 
['A', 'C'],
['A', 'B']]) == false

p is_wristband(
[['A', 'A'],
['B', 'B'],
['C', 'C'],
['D', 'B']]) == false
 
p is_wristband(
[['A', 'A'],
['B', 'B'],
['C', 'C'],
['C', 'C']]) == true
