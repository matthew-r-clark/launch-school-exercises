MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY

def after_midnight(time)
  hours, minutes = time.split(':').map {|e| e.to_i}
  # map method could also be written as: .map(&:to_i)
  (minutes + hours * MINUTES_PER_HOUR) % MINUTES_PER_DAY
end

def before_midnight(time)
  total_minutes = MINUTES_PER_DAY - after_midnight(time)
  total_minutes = 0 if total_minutes == MINUTES_PER_DAY
  total_minutes
end

puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0
