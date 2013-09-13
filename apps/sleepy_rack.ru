app = proc do |env|
  sleep(2) if rand(10) == 1
  sleep(0.1)
 
  [200, {'content-type' => "text/html"}, ["Hello, World"]]
end

run app
