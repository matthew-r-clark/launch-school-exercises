def rotate90(m)
  arr = []
  m[0].size.times {arr << []}
  m.size.times do |r|
    m[0].size.times do |c|
      arr[c] << m[r][c]
    end
  end
  arr.map {|subarray| subarray.reverse}
end

def rotate90!(m)
  m.size.times do |r|
    m[0].size.times do |c|
      m[r][c], m[c][r] = m[c][r], m[r][c] if r > c
    end
  end
  m.map! {|subarray| subarray.reverse}
end

def rotate(m, degrees)
  raise "Rotation must be in increments of 90 degrees." if degrees % 90 != 0
  loop do
    degrees -= 360 if degrees > 360
    break if degrees <= 360
  end

  return m if degrees == 360

  arr = []
  m[0].size.times {arr << []}
  m.size.times do |r|
    m[0].size.times do |c|
      arr[c] << m[r][c]
    end
  end

  if degrees == 90
    arr.map {|subarray| subarray.reverse}
  elsif degrees == 270
    arr.reverse
  elsif 180
    m.reverse.map {|subarray| subarray.reverse}
  end
end


matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

p rotate(matrix1, 180) == [[6,9,3],[2,7,4],[8,5,1]]
p rotate(matrix1, 270) == [[8,2,6],[5,7,9],[1,4,3]]
p rotate(matrix1, 360) == [[1,5,8],[4,7,2],[3,9,6]]
p rotate(matrix1, 450) == [[3,4,1],[9,7,5],[6,2,8]]
p rotate(matrix1, 540) == [[6,9,3],[2,7,4],[8,5,1]]
p rotate(matrix1, 630) == [[8,2,6],[5,7,9],[1,4,3]]
p rotate(matrix1, 720) == [[1,5,8],[4,7,2],[3,9,6]]
p rotate(matrix1, 128) == "Rotation must be in increments of 90 degrees."

# new_matrix1 = rotate90(matrix1)
# new_matrix2 = rotate90(matrix2)
# new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

# p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
# p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
# p new_matrix3 == matrix2

# matrix1_id = matrix1.object_id
# rotate90!(matrix1)
# p matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
# p matrix1.object_id == matrix1_id