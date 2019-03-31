# use an array of times with 24h format
# convert input into 24h format
# calculate time remaining to next meal

def calculate_time(current_time, next_meal_time)
  current_time_float = current_time[0] + current_time[1].to_f / 60
  current_time_float -= 24 if current_time_float > 19

  until_next_meal = next_meal_time - current_time_float
  hours = until_next_meal.to_i
  mins = (until_next_meal - hours) * 60
  [hours, mins.round]
end

def time_to_eat(time)
  hours, mins = time.split(":")
  mins, period = mins.split
  mins = mins.to_i
  hours = hours.to_i
  hours += 12 if period.chars.include?("p") && hours != 12
  hours = 0 if period.chars.include?("a") && hours == 12

  current_time = [hours, mins]
  case current_time[0]
  when (0...7)   then calculate_time(current_time, 7)
  when (7...12)  then calculate_time(current_time, 12)
  when (12...19) then calculate_time(current_time, 19)
  else                calculate_time(current_time, 7)
  end
end

p time_to_eat("2:00 p.m.") == [5, 0]
p time_to_eat("5:50 a.m.") == [1, 10]
p time_to_eat("6:37 p.m.") == [0, 23]
p time_to_eat("12:00 a.m.") == [7, 0]
p time_to_eat("11:58 p.m.") == [7, 2]
p time_to_eat("3:33 p.m.") == [3, 27]