require "rubygems"
require "json"
require 'blinky'
require 'colormath'
require "crawler/net_http"
require "colour/colour"

# Constantes
proxy_host="localhost"
proxy_port="3128"
jobJsonUrl="http://dv56sws01.rouen.francetelecom.fr:59600/job/Tests/api/json"

if(!ARGV[0])
  score = Crawler::Crawler.new.watch_test_server 'https://builds.apache.org/job/central-indexer-test/api/json'
  score = score.to_i
else
  score = ARGV[0].to_i
end
print("score ",score,"\n")
colour = Colour::Colour.new score
print("colour : ",colour.hex.gsub("#", ""),"\n")
#blinky = Blinky.new
#blinky.lights[0].score(colour)

