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

def palindrome?(str)
  str == str.reverse && str.size > 1
end

def palindromes(str)
  substrings(str).select do |substring|
    palindrome?(substring)
  end
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
