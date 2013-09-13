require 'eventmachine'
require 'goliath'

class SleepyGoliath < Goliath::API
  STATE = {
    i: 0,
    widgets: [],
    fibers: []
  }

  def self.start_timer
    return if @timer_started
    @timer_started = true
    
    EM.add_periodic_timer(0.5) do
      print "#{STATE[:i]},"
      STATE[:i] += 1 if STATE[:i] < 100
      STATE[:widgets] << "widget #{STATE[:i]}"
      while STATE[:widgets].length > 0 && STATE[:fibers].length > 0
        STATE[:fibers].shift.resume(STATE[:widgets].shift)
      end
    end
  end

  def get_widget
    STATE[:fibers] << Fiber.current
    Fiber.yield
  end
   
  def response(env)
    self.class.start_timer
    if env['REQUEST_PATH'] =~ /fast/
      get_widget
      print 'X'      
    else
      10.times { get_widget }
      print 'Y'
    end

    [200, {}, "Hello, World! #{get_widget}"]
  end
end
