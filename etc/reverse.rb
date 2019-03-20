# Take in a string and return the string in reverse
# without using the String#reverse method.

# Make a copy of the string
# In a loop, swap first and last chars, decreasing the first
# index and decreasing the last index until first index is equal
# to half the size of the string.

def my_reverse(str)
  new_str = str.chars.join
  my_reverse!(new_str)
end

def my_reverse!(str)
  first = 0
  last = -1

  while first < str.size / 2
    str[first], str[last] = str[last], str[first]

    first += 1
    last -= 1
  end

  str
end

p str1 = "This string won't be mutated."
p "str1 object_id before my_reverse: #{str1.object_id}"
p str1_new = my_reverse(str1)
p "str1_new object_id after my_reverse: #{str1_new.object_id}"
p "str1: #{str1} and object_id: #{str1.object_id}"

puts

p str2 = "This string will be mutated."
p "str2 object_id before my_reverse!: #{str2.object_id}"
p str2_new = my_reverse!(str2)
p "str2_new object_id after my_reverse!: #{str2_new.object_id}"
p "str2: #{str2} and object_id: #{str2.object_id}"