def imperfect?(rug)
  !horizontally_perfect?(rug) && !vertically_perfect?(rug)
end

def perfect?(rug)
  horizontally_perfect?(rug) && vertically_perfect?(rug)
end

def horizontally_perfect?(rug)
  vertically_perfect?(rug[0].zip(*rug[1..-1]))
end

def vertically_perfect?(rug)
  rug.each {|row| return false if row != row.reverse}
end

def classify_rug(rug)
  if imperfect?(rug)
    "imperfect" 
  elsif perfect?(rug)
    "perfect"
  elsif horizontally_perfect?(rug)
    "horizontally symmetric"
  elsif vertically_perfect?(rug)
    "vertically symmetric" 
  end
end

p classify_rug([
	['a', 'a', 'b'],
  ['a', 'a', 'b']
]) == "horizontally symmetric"

p classify_rug([
  ['a']
]) == "perfect"

p classify_rug([
  ['a'],
  ['b'], 
  ['a']
]) == "perfect"

p classify_rug([
  ['a'],
  ['b'], 
  ['c']
]) == "vertically symmetric"

p classify_rug([
  ['a', 'b', 'a']
]) == "perfect"

p classify_rug([
  ['a', 'a']
]) == "perfect"

p classify_rug([
  ['d', 'a'],
  ['b', 'b'],
  ['d', 'a']
]) == "horizontally symmetric"

p classify_rug([
  ['d', 'a', 'a', 'a'],
  ['b', 'b', 'a', 'a'],
  ['d', 'a', 'a', 'a']
]) == "horizontally symmetric"

p classify_rug([
  ['a', 'a', 'a', 'a'],
  ['d', 'a', 'a', 'a']
]) == "imperfect"