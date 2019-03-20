POSSIBLE = { # keys as numbers, values as array of neighbors
  '1'=>['1','2','4'], '2'=>['1','2','5','3'], '3'=>['2','3','6'],
  '4'=>['1','4','5','7'], '5'=>['2','4','5','6','8'], '6'=>['3','5','6','9'],
  '7'=>['4','7','8'], '8'=>['5','7','8','9','0'], '9'=>['6','8','9'], '0'=>['0','8']
}

def get_pins(observed)
  possible_prefixes = POSSIBLE[observed[0]]
  return possible_prefixes if observed.size == 1
  observed[1..-1].chars.each do |char|
    temp_prefixes = []
    possible_prefixes.each do |prefix|
      POSSIBLE[char].each do |possibility|
        temp_prefixes << prefix + possibility
      end
    end
    possible_prefixes = temp_prefixes
  end
  possible_prefixes
end

p get_pins("1")
p get_pins("11")
p get_pins("369")
