require 'goliath'
require 'rbtrace'

class SleepyGoliath < Goliath::API
  def response(env)
    EM::Synchrony.sleep(2) if rand(10) == 1
    EM::Synchrony.sleep(0.1)
    [200, {}, "Hello, World!"]
  end
end
