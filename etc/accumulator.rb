

def accum(str)
  groups = []
  count = 1
  str.each_char do |char|
    groups << char * count
    count += 1
  end
  groups.map {|letters| letters.capitalize}.join("-")
end

p accum("abcd") == "A-Bb-Ccc-Dddd"
p accum("RqaEzty") == "R-Qq-Aaa-Eeee-Zzzzz-Tttttt-Yyyyyyy"
p accum("cwAt") == "C-Ww-Aaa-Tttt"