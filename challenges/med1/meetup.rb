require 'date'

class Meetup
  START_DATE = {
    first: 1,
    second: 8,
    third: 15,
    fourth: 22,
    teenth: 13,
    last: -7
  }

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, schedule)
    date = Date.new(year, month, START_DATE[schedule])

    7.times do
      return date if date.send("#{weekday}?".to_sym)
      date = date.next
    end
  end

  private

  attr_reader :month, :year
end
