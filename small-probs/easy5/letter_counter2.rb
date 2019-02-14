def word_sizes(words)
  counts = Hash.new(0)
  return counts if words.size == 0
  words.split.each do |word|
    size = word.chars.select{|char| char =~ /\w/}.count
    counts[size] += 1
  end
  counts
end

puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
puts word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
puts word_sizes('') == {}
