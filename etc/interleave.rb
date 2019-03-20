

def interleave(arr1, arr2)
  # arr1.zip(arr2).flatten

  #and without using zip
  output = []
  arr1.each_with_index {|element, index| output << element << arr2[index]}
  output
end

p interleave([1,2,3], ['a','b','c']) == [1,'a',2,'b',3,'c']