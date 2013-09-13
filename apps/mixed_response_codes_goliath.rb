require 'goliath'
require 'rbtrace'

EM.set_descriptor_table_size(10_000)

RESPONSES = {200 => [200, {}, "Hello, World!"],
             302 => [302, {"Location" => "/elsewhere"}, ""],
             404 => [404, {}, "Not Found"],
             500 => [500, {}, "Danger!"]}
 
class MixedResponseCodesGoliath < Goliath::API
  def response(env)
    EM::Synchrony.sleep(6) if rand(30) == 10
     
    EM::Synchrony.sleep(0.1)
   
    if rand(80) == 1   
      if rand(5) == 1
        RESPONSES[404]
      elsif rand(10) == 1
        RESPONSES[500]
      else
        RESPONSES[302]
      end
    else
      RESPONSES[200]
    end
  end
end
