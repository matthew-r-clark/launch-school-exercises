def time_of_day(total_mins)
  hours = total_mins / 60
  hours = hours % 24 if hours.abs > 24
  minutes = total_mins % 60
  if hours < 0
    hours = 24 + hours
  end
  num_to_string(hours) + ':' + num_to_string(minutes)
end

def num_to_string(num)
  num.to_s.size < 2 ? "0#{num}" : num.to_s
end

# launch school solution:
# MINUTES_PER_HOUR = 60
# HOURS_PER_DAY = 24
# MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR
#
# def time_of_day(delta_minutes)
#   delta_minutes =  delta_minutes % MINUTES_PER_DAY
#   hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
#   format('%02d:%02d', hours, minutes)
# end

puts time_of_day(0) == "00:00"
puts time_of_day(-3) == "23:57"
puts time_of_day(35) == "00:35"
puts time_of_day(-1437) == "00:03"
puts time_of_day(3000) == "02:00"
puts time_of_day(800) == "13:20"
puts time_of_day(-4231) == "01:29"
