# initialize new array of 
# iterate through each subarry of matrix
  # create a new subarray within new array if it doesn't exist
  # append index value to appropriate subarray within new array

# def transpose(matrix)
#   arr = []

#   matrix.each do |subarray|
#     subarray.each_with_index do |element, index|
#       arr[index] = [] if arr[index] == nil
#       arr[index] << element
#     end
#   end

#   arr
# end

def transpose(m)
  arr = []
  m[0].size.times {arr << []}
  m.size.times do |r|
    m[0].size.times do |c|
      arr[c] << m[r][c]
    end
  end
  arr
end

def transpose!(m)
  m.size.times do |r|
    m[0].size.times do |c|
      m[r][c], m[c][r] = m[c][r], m[r][c] if r > c
    end
  end
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

# p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
# p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

# matrix_id = matrix.object_id
# transpose!(matrix)
# p matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
# p matrix.object_id == matrix_id

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]