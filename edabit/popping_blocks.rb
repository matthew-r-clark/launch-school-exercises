
def has_pairs?(blocks)
  return false if blocks.empty?
  blocks[1..-1].each_with_index do |block, index|
    return true if block == blocks[index]
  end
  false
end

def delete_first_repeater(blocks)
  blocks.size.times do |num|
    if blocks[num] == blocks[num+1]
      current = blocks[num]
      while blocks[num] == current
        blocks.delete_at(num)
      end
      return blocks
    end
  end
end

def final_result(blocks)
  while has_pairs?(blocks)
    delete_first_repeater(blocks)
  end
  
  blocks
end


p final_result(['B', 'B', 'A', 'C', 'A', 'A', 'C']) #== ['A']
p final_result(['B', 'B', 'C', 'C', 'A', 'A', 'A']) #== []
p final_result(['C', 'A', 'C']) #== ['C', 'A', 'C']
p final_result(['C', 'A', 'A', 'C', 'B']) #== ['B']
p final_result(['C', 'C']) #== []
p final_result(['A', 'B', 'C', 'C', 'B', 'D', 'A']) #== ['A', 'D', 'A']
p final_result(['A', 'B', 'A', 'A', 'A', 'B', 'B']) #== ['A']