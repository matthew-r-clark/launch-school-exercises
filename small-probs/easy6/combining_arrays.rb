# Takes two arrays in, returns a single array with combined values of two
# original arrays excluding duplicate values.

def merge(arr1, arr2)
  arr1.append(arr2).flatten.uniq
  
  # also example from LS, uses Array#union or Array#|
  # arr1 | arr2
end

puts merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
