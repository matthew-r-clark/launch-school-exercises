def substrings(str)
  sub_arr = []
  str.size.times do
    0.upto(str.size - 1) do |index|
      sub_arr << str[0..index]
    end
    str = str[1..-1]
  end
  sub_arr
end


p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
