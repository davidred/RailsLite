require 'webrick'

server = WEBrick::HTTPServer.new Port: 3000

server.mount_proc '/' do |req, res|
  res.body = "Hello World!"
end

server.start

trap 'INT' do server.shutdown end
