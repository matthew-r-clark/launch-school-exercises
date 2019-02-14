def palindrome?(str)
  str == str.reverse
end

def real_palindrome?(str)
  str = str.downcase.delete('^a-z0-9')
  palindrome?(str)
end

def palindromic_number?(num)
  palindrome?(num.to_s)
end

# puts "simple palindrome tests:"
# puts palindrome?('madam') == true ? "Pass" : "Fail"
# puts palindrome?('Madam') == false ? "Pass" : "Fail"
# puts palindrome?("madam i'm adam") == false ? "Pass" : "Fail"
# puts palindrome?('356653') == true ? "Pass" : "Fail"
# puts palindrome?([1, 2, 3, 2, 1]) == true ? "Pass" : "Fail"
#
# puts ""
# puts "real palindrome tests:"
# puts real_palindrome?('madam') == true ? "Pass" : "Fail"
# puts real_palindrome?('Madam') == true ? "Pass" : "Fail"
# puts real_palindrome?("Madam, I'm Adam") == true ? "Pass" : "Fail"
# puts real_palindrome?('356653') == true ? "Pass" : "Fail"
# puts real_palindrome?('356a653') == true ? "Pass" : "Fail"
# puts real_palindrome?('123ab321') == false ? "Pass" : "Fail"

puts ""
puts "palindromic number tests:"
puts palindromic_number?(34543) == true ? "Pass" : "Fail"
puts palindromic_number?(123210) == false ? "Pass" : "Fail"
puts palindromic_number?(22) == true ? "Pass" : "Fail"
puts palindromic_number?(5) == true ? "Pass" : "Fail"
puts palindromic_number?(0123210) == true ? "Pass" : "Fail"
