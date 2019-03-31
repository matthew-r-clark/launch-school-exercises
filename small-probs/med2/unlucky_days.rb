# iterate through month's 13th day to see if it's Friday, add to counter

require 'date'

def friday_13th(year)
  fridays = 0

  1.upto(12) do |month|
    fridays += 1 if Date.new(year, month, 13).friday?
  end

  fridays
end


# iterate through months, starting with first day
  # iterate through days in month, counting fridays
  # if fridays in month > 5, add to five_fridays counter
# return five_fridays counter

def five_fridays(year)
  num_days = {
    1=>31, 2=>28, 3=>31, 4=>30, 5=>31, 6=>30,
    7=>31, 8=>31, 9=>30, 10=>31, 11=>30, 12=>31
  }

  five_fridays = 0
  num_days[2] = 29 if Date.new(year).leap?

  1.upto(12) do |month|
    num_fridays = 0
    1.upto(num_days[month]) do |day|
      date = Date.new(year, month, day)
      num_fridays += 1 if date.friday?
    end
    five_fridays += 1 if num_fridays >= 5
  end

  five_fridays
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

p five_fridays(2018) == 4
p five_fridays(2019) == 4
p five_fridays(2020) == 4
p five_fridays(2021) == 5
p five_fridays(2022) == 4
p five_fridays(2023) == 4
p five_fridays(2024) == 4
p five_fridays(2025) == 4