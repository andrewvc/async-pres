require 'goliath'

class SleepyGoliath < Goliath::API
  @@i = 0
   
  def response(env)
    EM::Synchrony.sleep(6) if rand(10) == 1
    EM::Synchrony.sleep(4)
    @@i += 1
    [200, {}, "Hello, World! #{@@i}"]
  end
end
