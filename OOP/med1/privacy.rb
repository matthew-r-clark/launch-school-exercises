class Machine

  def initialize
    @switch = :off
  end

  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  def display_switch
    puts switch
  end

  private

  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

xmachina = Machine.new
xmachina.display_switch
xmachina.start
xmachina.display_switch
xmachina.stop
xmachina.display_switch