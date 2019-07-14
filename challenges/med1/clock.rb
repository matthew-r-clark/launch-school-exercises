class Clock
  attr_accessor :hours, :minutes

  def initialize(hours, minutes)
    @hours = hours
    @minutes = minutes
  end

  def self.at(hours, minutes=0)
    Clock.new(hours, minutes)
  end

  def to_s
    format("%02d:%02d", hours, minutes)
  end

  def +(m_input)
    h_update, m_update = (m_input + minutes).divmod(60)
    h_update += hours
    while h_update > 23
      h_update -= 24
    end
    Clock.at(h_update, m_update)
  end

  def -(m_input)
    h_update = 0
    m_update = minutes - m_input
    while m_update < 0
      m_update += 60
      h_update += 1
    end
    h_update = hours - h_update
    while h_update < 0
      h_update += 24
    end
    Clock.at(h_update, m_update)
  end

  def ==(other)
    hours == other.hours && minutes == other.minutes
  end
end
