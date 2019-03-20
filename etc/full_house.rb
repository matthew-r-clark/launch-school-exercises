# Given an array of five card values, determine whether the hand is a
# full house (3 of a kind and 2 of a kind)

# Group elements by type
# Order them by greatest number of elements to least
# Check to see if there are two groups and one has three values

def full_house?(hand)
  groups = hand.group_by {|card| card}
  return false unless groups.keys.size == 2
  groups.any? {|key, val| val.size == 3}
end

p full_house?(%w(A A A K K)) == true
p full_house?(%w(3 J J 3 3)) == true
p full_house?(%w(10 J 10 10 10)) == false
p full_house?(%w(7 7 7 4 2)) == false