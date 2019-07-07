def step(start, stop, step_size)
  current = start
  while current <= stop
    yield current
    current += step_size
  end
  stop
end

step(1, 10, 3) { |value| puts "value = #{value}" }