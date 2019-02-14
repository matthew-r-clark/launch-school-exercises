def reverse_sentence(str)
  # ary = str.split(' ')
  # ary.reverse!
  # new_str = ''
  # ary.each do |word|
  #   new_str << word + ' '
  # end
  # result = new_str.chomp(' ')
  str.split.reverse.join(' ')
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
