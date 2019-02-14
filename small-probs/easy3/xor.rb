def xor?(x, y)
  (x && !y) || (y && !x)
end

puts xor?(5.even?, 4.even?) == true ? "Pass" : "Fail"
puts xor?(5.odd?, 4.odd?) == true ? "Pass" : "Fail"
puts xor?(5.odd?, 4.even?) == false ? "Pass" : "Fail"
puts xor?(5.even?, 4.odd?) == false ? "Pass" : "Fail"
