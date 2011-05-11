app = proc do |env|
  sleep(rand(3) + 1)
  [200, {'content-type' => "text/html"}, ["Hello, World"]]
end

run app
