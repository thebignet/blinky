require "rubygems"
require "json"
require 'blinky'
require 'colormath'
require "crawler/net_http"
require "colour/colour"

# Constantes
#proxy_host="localhost"
proxy_host=nil
proxy_port="3128"
if(proxy_host!=nil)
  proxy=Net::HTTP::Proxy(proxy_host, proxy_port)
else
  proxy=nil
end

jobJsonUrl="http://dv56sws01.rouen.francetelecom.fr:59600/job/Tests/api/json"
#jobJsonUrl='https://builds.apache.org/job/central-indexer-test/api/json'


blinky = Blinky.new
if(!ARGV[0])
  blinky.lights[0].watch_test_server(jobJsonUrl,proxy)
else
  score = ARGV[0].to_i
  print("score ",score,"\n")
  colour = Colour::Colour.new score
  print("colour : ",colour.hex.gsub("#", ""),"\n")
  blinky.lights[0].colour!(colour)
end


