# split string into array of weights
# call sort_by and sort by the sum of digits
# join array elements with a " "

def order_weight(str)
  str.split.sort.sort_by {|num| num.to_i.digits.reduce(:+)}.join(" ")
end

p order_weight("103 123 4444 99 2000") == "2000 103 123 4444 99"
p order_weight("2000 10003 1234000 44444444 9999 11 11 22 123") == "11 11 2000 10003 22 123 1234000 44444444 9999"
