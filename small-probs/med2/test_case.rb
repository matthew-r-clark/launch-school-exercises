def test(x)
  case x
  when 1, 5 then "outer"
  when 2, 4 then "inner"
  when 3 then "exact middle"
  end
end

p test(1)
p test(2)
p test(3)
p test(4)
p test(5)