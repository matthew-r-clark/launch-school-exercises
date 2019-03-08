def crunch(string)
  prev = nil
  result = ''
  string.each_char do |chr|
    if chr != prev
      result << chr
    end
    prev = chr
  end
  result
end

puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba'
puts crunch('ggggggggggggggg') == 'g'
puts crunch('a') == 'a'
puts crunch('') == ''
