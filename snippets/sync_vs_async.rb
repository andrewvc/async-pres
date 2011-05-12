# Synchronous
Net::HTTP.get_print 'www.example.net', '/index.html'#

# Asynchronous
request = EM::HttpRequest.new('www.example.net/index.html').get
http.callback {
  puts http.response
}

# Asynchronous Fibered
http = EventMachine::HttpRequest.new('www.example.net').get :timeout => 10
