require "rubygems"
require "json"
require 'blinky'
require 'colormath'
require "crawler/net_http"
require "colour/colour"

# Constantes
#proxy_host='localhost'
proxy_host=nil
proxy_port=nil
if(proxy_host!=nil)
  proxy=Net::HTTP::Proxy(proxy_host, proxy_port)
else
  proxy=nil
end

url_server='http://dvedvp65.rouen.francetelecom.fr:6900'
job='Tests'

blinky = Blinky.new
if(!ARGV[0])
  blinky.lights[0].watch_test_server(url_server,proxy,job)
else
  score = ARGV[0].to_i
  print("score ",score,"\n")
  colour = Colour::Colour.new score
  print("colour : ",colour.hex.gsub("#", ""),"\n")
  blinky.lights[0].colour!(colour)
end


