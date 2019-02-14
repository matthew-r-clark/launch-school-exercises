# 1. determine century
# 2. append appropriate suffix (helper function)

def suffix(num)
  century = num.to_s
  if century[-2] == '1' || !['1','2','3'].include?(century[-1])
    century += 'th'
  elsif century[-1] == '1'
    century += 'st'
  elsif century[-1] == '2'
    century += 'nd'
  elsif century[-1] == '3'
    century += 'rd'
  end
  century
end

def century(year)
  century = nil
  if year % 100 == 0
    century = year/100
  else
    century = (year/100) + 1
  end
  suffix(century)
end

puts century(2000) == '20th' ? 'Pass' : 'Fail'
puts century(2001) == '21st' ? 'Pass' : 'Fail'
puts century(1965) == '20th' ? 'Pass' : 'Fail'
puts century(256) == '3rd' ? 'Pass' : 'Fail'
puts century(5) == '1st' ? 'Pass' : 'Fail'
puts century(10103) == '102nd' ? 'Pass' : 'Fail'
puts century(1052) == '11th' ? 'Pass' : 'Fail'
puts century(1127) == '12th' ? 'Pass' : 'Fail'
puts century(11201) == '113th' ? 'Pass' : 'Fail'
