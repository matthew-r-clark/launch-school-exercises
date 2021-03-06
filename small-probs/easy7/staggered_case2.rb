# Take in a String
# Return a String with alternating case, starting with upcase, igoring
# non-letters, but still using non-letter characters to alternate case.
# EDIT: user provides a boolean value as second argument if they want
# the output string to start with a downcase letter.

def staggered_case(str, count_nums = true, upper = true)
  caps = !upper # this is so that the caps value can be reset at start of #map
  str.chars.map do |char|
    if char =~ /[a-zA-Z]/
      caps = !caps
      caps ? char.upcase : char.downcase
    else
      caps = !caps if count_nums
      char
    end
  end
  .join
end

p staggered_case('I Love Launch School!', false) == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS', false) == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
p staggered_case('ignore 77 the 444 numbers', true, false) == 'iGnOrE 77 tHe 444 nUmBeRs'
