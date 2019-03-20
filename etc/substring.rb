# Returns substring based on specified indices.

def substring(str, start, stop=start)
  str[start..stop]
end

p substring("honey", 0, 2) == "hon"
p substring("honey", 1, 2) == "on"
p substring("honey", 3, 9) == "ey"
p substring("honey", 2) == "n"