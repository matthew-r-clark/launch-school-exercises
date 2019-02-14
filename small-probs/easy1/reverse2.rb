def reverse_words(str)
  ary = str.split
  ary.each do |word|
    word.reverse! if word.size >= 5
  end
  ary.join(' ')
end

puts reverse_words('Professional') == 'lanoisseforP'
puts reverse_words('Walk around the block') == 'Walk dnuora the kcolb'
puts reverse_words('Launch School') == 'hcnuaL loohcS'
