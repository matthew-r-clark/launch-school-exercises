def short_long_short(str1, str2)
  if str1.size > str2.size
    str2 + str1 + str2
  else
    str1 + str2 + str1
  end

end

puts short_long_short('abc', 'defgh') == "abcdefghabc" ? "Pass" : "Fail"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh" ? "Pass" : "Fail"
puts short_long_short('', 'xyz') == "xyz" ? "Pass" : "Fail"
