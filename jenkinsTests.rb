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

#if(!ARGV[0])
#  score = Blinky::JenkinsServer.score(jobJsonUrl, proxy_host, proxy_port, nil, nil)
#else
#  score = ARGV[0].to_i
#end
#print("score ",score,"\n")
score=ARGV[0].to_i
puts score
colour = Colour::Colour.new score
puts colour.hex
#print("colour : ",colour.hex.gsub("#", ""),"\n")
#blinky = Blinky.new
#blinky.lights[0].score(colour)
crawler = Crawler::Crawler.new
puts crawler.watch_test_server 'https://builds.apache.org/job/central-indexer-test/api/json'

