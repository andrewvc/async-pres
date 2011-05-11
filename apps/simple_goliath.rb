require 'goliath'
require 'rbtrace'

PAYLOAD = "response" * 10000

class SimpleGoliath < Goliath::API
  def response(env)
    print '.'
    [200, {}, PAYLOAD]
  end
end
