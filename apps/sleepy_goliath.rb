require 'goliath'
require 'rbtrace'

EM.set_descriptor_table_size(10_000)
 
class SleepyGoliath < Goliath::API
  def response(env)
    EM::Synchrony.sleep(rand(3) + 1)
    [200, {}, "Hello, World!"]
  end
end
