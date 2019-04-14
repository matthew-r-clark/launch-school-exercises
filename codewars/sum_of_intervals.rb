# find overlapping intervals

def sum_of_intervals(intervals)
  intervals.map {|e| (e.first...e.last).to_a }.flatten.uniq.size
end

p sum_of_intervals( [
   [1,2],
   [6, 10],
   [11, 15]
] ) == 9

p sum_of_intervals( [
   [1,4],
   [7, 10],
   [3, 5]
] ) == 7

p sum_of_intervals( [
   [1,5],
   [10, 20],
   [1, 6],
   [16, 19],
   [5, 11]
] ) == 19