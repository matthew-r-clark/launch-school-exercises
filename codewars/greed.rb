POINT_VALUES = {
  1=>[100,1000], 2=>[0,200], 3=>[0,300],
  4=>[0,400], 5=>[50,500], 6=>[0,600]
}

def score(dice)
  score = 0

  1.upto(6) do |num|
    value = dice.select {|e| e == num}.size
    if value >= 3
      score += POINT_VALUES[num][1]
      value -= 3
    end
    if value > 0
      score += POINT_VALUES[num][0] * value
    end
  end

  score
end

def generate_dice
  dice = []
  5.times do
    dice << (1..6).to_a.sample
  end
  dice
end

# puts score( [2, 3, 4, 6, 2] ) == 0
# puts score( [2, 2, 2, 3, 3] ) == 200
# puts score( [2, 4, 4, 5, 4] ) == 450
puts score([6, 1, 3, 1, 1])
puts score([1, 1, 1, 5, 5])

def run_test(cycles)
  cycles.times do
    dice = generate_dice
    print dice
    p score(dice)
  end
end

# run_test(20)

# problems
# [6, 1, 3, 1, 1]1300
# [1, 1, 1, 5, 5]1400
