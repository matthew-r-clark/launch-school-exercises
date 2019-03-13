# Takes in an Integer, n, which determines the number of lights.
# Returns an Array of lights that are on after n iterations through where
# each iteration toggles every iteration_number number of lights.

def initialize_lights(lights)
  lights_hash = {}
  1.upto(lights) {|key_num| lights_hash[key_num] = false}
  lights_hash
end

def on_lights(hash)
  hash.select {|k, v| v }.keys
end

def lights(n)
  lights = initialize_lights(n)
  1.upto(n) do |step|
    toggle = lights.keys.select {|key| key % step == 0}
    toggle.each {|key| lights[key] = !lights[key]}
  end
  on_lights(lights)
end

p lights(5) == [1, 4]
p lights(10) == [1, 4, 9]
p lights(1000)
