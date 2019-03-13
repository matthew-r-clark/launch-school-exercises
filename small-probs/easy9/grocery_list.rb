# Takes in an array of elements which are arrays containing a fruit and
# a quantity of that fruit.
# Returns an array of of strings of the correct number of all fruits.

def buy_fruit(list)
  fruits = []
  list.each do |arr|
    arr[1].times { |_| fruits << arr[0] }
  end
  fruits

  # LS solution:
  # list.map { |fruit, quantity| [fruit] * quantity }.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
