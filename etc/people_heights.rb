# Some people are standing in a row in a park. There are trees between  them which cannot be moved. 
# Your task is to rearrange the people by  their heights in a non-descending order without moving the trees. 
# People  can be very tall!

# Example

# For `a = [-1, 150, 190, 170, -1, -1, 160, 180]`, the output should be
#  `sortByHeight(a) = [-1, 150, 160, 170, -1, -1, 180, 190]`.

# Input/Output

# - **[execution time limit] 4 seconds (rb)**

# - **[input] array.integer a**

#   If `a[i] = -1`, then the `ith` position is occupied by a tree. Otherwise `a[i]` is the height of a person standing in the `ith` position.

#   *Guaranteed constraints:*
#    `1 ≤ a.length ≤ 1000`,
#    `-1 ≤ a[i] ≤ 1000`.

# - **[output] array.integer**

#   - Sorted array `a` with all the trees untouched.

# select all values that aren't trees, store in a new array
# sort that array
# iterate back through original array, replace any non-negative value, with the next value in new array.

def sortByHeight(a)
  people = a.select {|e| e >= 0}.sort
  a.map {|e| e == -1 ? e : people.shift}
end

p sortByHeight([-1, 150, 190, 170, -1, -1, 160, 180])
p sortByHeight([-1, -1, -1, -1, -1])
p sortByHeight([-1])
p sortByHeight([4, 2, 9, 11, 2, 16])
p sortByHeight([2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1])
p sortByHeight([23, 54, -1, 43, 1, -1, -1, 77, -1, -1, -1, 3])