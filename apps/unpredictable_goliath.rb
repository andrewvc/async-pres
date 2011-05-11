require 'goliath'
require 'rbtrace'

EM.set_descriptor_table_size(10_000)
 
class UnpredictableGoliath < Goliath::API
  def response(env)
    EM::Synchrony.sleep(6) if rand(30) == 10
     
    EM::Synchrony.sleep(0.1)
    [200, {}, "Hello, World!"]
  end
end
