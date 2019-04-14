def num_blocks(w, l, h)
  blocks = 0
  h.times do
    blocks += w * l
    w += 1
    l += 1
  end
  blocks
end

p num_blocks(1, 1, 2) #== 5
p num_blocks(2, 4, 3) #== 47
p num_blocks(1, 10, 10) #== 880
p num_blocks(20, 30, 40) #== 83540