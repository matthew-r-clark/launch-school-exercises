# Create a graph of nearest neighbors
# Answer is size of largest nearest neighbors
# array + 1 (to cover self)

def create_graph(grid, x, y)
  graph = {}
  location = 1

  y.times do |y_index|
    x.times do |x_index|
      graph["node#{location.to_s}"] = [grid[y_index][x_index], [x_index, y_index]]
      location += 1
    end
  end
  graph
end

def get_ones(graph)
  graph.values.select {|val| val[0] == 1}.map {|arr| arr[1]}
end

def get_islands(ones, grid, x_max, y_max)
  islands = []
  temp_collector = []
  ones.each do |val|
    x_index, y_index = val[0], val[1]
    up = y_index >= 1
    down = y_index < y_max
    left = x_index >= 1
    right = x_index < x_max

    temp_collector << grid[y_index][x_index]
    temp_collector << grid[y_index-1][x_index-1] if up && left
    temp_collector << grid[y_index-1][x_index] if up
    temp_collector << grid[y_index-1][x_index+1] if up && right
    temp_collector << grid[y_index][x_index-1] if left
    temp_collector << grid[y_index][x_index+1] if right
    temp_collector << grid[y_index+1][x_index-1] if down && left
    temp_collector << grid[y_index+1][x_index] if down
    temp_collector << grid[y_index+1][x_index+1] if down && right

    islands << temp_collector.select {|el| el == 1}.reduce(:+)
    temp_collector = []
  end

  islands
end

def largest_island(grid)
  x, y = grid[0].size, grid.size
  
  graph = create_graph(grid, x, y)
  ones = get_ones(graph)
  islands = get_islands(ones, grid, x-1, y-1)

  islands.max
end


p largest_island([
  [1, 0, 0], 
  [0, 0, 0], 
  [0, 0, 1]
]) == 1

p largest_island([
  [1, 1, 0], 
  [0, 1, 1], 
  [0, 0, 1]
]) == 5

p largest_island([
  [1, 0, 0], 
  [1, 0, 0], 
  [1, 0, 1]
]) == 3

p largest_island([
  [1]
]) == 1

p largest_island([
  [1],
  [0],
  [1]
]) == 1

p largest_island([
  [1, 0],
  [0, 1],
  [0, 0]
]) == 2