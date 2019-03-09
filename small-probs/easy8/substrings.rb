# def substrings_at_start(str)
#   substrings = []
#   memo = ""
#   str.chars.each_with_index do |char|
#     memo += char
#     substrings << memo
#   end
#   substrings
# end

def substrings_at_start(str)
  substrings = []
  1.upto(str.size) do |index|
    substrings << str[0..index-1]
  end
  substrings
end

p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
