require 'goliath'
require 'rbtrace'

class SimpleGoliath < Goliath::API
  def response(env)
    [200, {}, "Hello World!"
  end
end
