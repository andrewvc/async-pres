app = proc do |env|
  print '.'
  [200, {'content-type' => "text/html"}, ["Hello, World!"]]
end

run app
