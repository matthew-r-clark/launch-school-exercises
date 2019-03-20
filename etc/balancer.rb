
def balancer(str)
  balance = 0
  str.each_char do |char|
    if char == "("
      balance += 1
    elsif char == ")"
      balance -= 1
    end
    return false if balance < 0
  end
  balance == 0 ? true : false
end

p balancer("hi") #== true
p balancer("(hi") #== false
p balancer("(hi)") #== true
p balancer(")hi(") #== false
p balancer("()(()(()))()()") #== true
p balancer("()(()(())))()()") #== false