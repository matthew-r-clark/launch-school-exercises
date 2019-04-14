# Takes in an Integer, n, which determines the number of lights.
# Returns an Array of lights that are on after n iterations through where
# each iteration toggles every iteration_number number of lights.

 # 1. using a hash
def initialize_lights(lights)
  lights_hash = {}
  1.upto(lights) {|key_num| lights_hash[key_num] = false}
  lights_hash
end

def on_lights(hash)
  hash.select {|k, v| v }.keys
end

def off_lights(hash)
  hash.select {|k, v| !v }.keys
end

def print_results(lights, state)
  plural = lights.size == 1 ? "is" : "are"
  s = plural == "is" ? "" : "s"

  message = "Light#{s} "
  case lights.size
  when 1 then message += lights.first.to_s
  when 2 then message += lights.join(" and ")
  else        message += lights[0...-1].join(", ") + " and #{lights[-1]}"
  end
  
  case state
  when "on" then message += " #{plural} on."
  when "off" then message += " #{plural} now off."
  end

  puts message
end

def lights(n)
  lights = initialize_lights(n)
  1.upto(n) do |step|
    toggle = lights.keys.select {|key| key % step == 0}
    toggle.each {|key| lights[key] = !lights[key]}
  end
  print_results(on_lights(lights), "on")
  print_results(off_lights(lights), "off")
end

# 2. using an array (pretty slow)
# def initialize_lights(num_lights)
#   lights = []
#   num_lights.times {|i| lights << i+1}
#   lights
# end

# def lights(n)
#   lights = initialize_lights(n)
#   2.upto(n) do |num|
#     lights.map! {|e| (lights.index(e) + 1) % num == 0 ? e * -1 : e}
#   end
#   lights.select {|e| e > 0}
# end

lights(2)
lights(5) #== [1, 4]
lights(10) #== [1, 4, 9]
# lights(1000) #== 
#   [
#     1, 4, 9, 16, 25, 36, 49, 64, 81, 100,
#     121, 144, 169, 196, 225, 256, 289,
#     324, 361, 400, 441, 484, 529, 576,
#     625, 676, 729, 784, 841, 900, 961
#   ]

