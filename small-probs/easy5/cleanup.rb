# Without regex:
# LETTERS = ('a'..'z').to_a + ('A'..'Z').to_a
#
# def cleanup(str)
#   clean = str.chars.map {|char| LETTERS.include?(char) ? char : ' '}
#   indexes_to_remove = []
#   clean.each_with_index do |val, ind|
#     if val == ' ' && clean[ind-1] == ' ' && ind != 0
#       indexes_to_remove << ind
#     end
#   end
#   indexes_to_remove.reverse.each do |i|
#     clean.delete_at(i)
#   end
#   clean.join('')
# end

# with regex
def cleanup(str)
  str.gsub(/\W/, ' ').squeeze(' ')
end

puts cleanup("---what's my +*& line?") # ' what s my line '
