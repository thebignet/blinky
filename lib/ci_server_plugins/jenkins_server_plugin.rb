require "colour/colour"
require "crawler/net_http"
require "net/http"

module Blinky
  module JenkinsServer
    def request_response uri_str, proxy=nil, limit = 10
      begin
        if proxy.nil?
          Net::HTTP.get(URI(uri_str))
        else
          result = proxy.get_response(URI.parse(uri_str))             
          case result
          when Net::HTTPSuccess     then result.body
          when Net::HTTPRedirection then request_response(result['location'], proxy, limit - 1)
          else
            result.error!
          end
        end
      rescue Exception => e
        puts e.message
        return false
      end
    end
    def score url_server, proxy = nil, job
      score = 0
      json = request_response(url_server+'/job/'+job+'/lastBuild/api/json',proxy)
      if !json
        puts 'request error'
      else
        testAppli = JSON.parse(json);
        if testAppli['building'] == true
          score = -1
        else
          actions = testAppli['actions']
          failCount = actions.last['failCount'].to_i
          print("failCount ",failCount,"\n")
          totalCount = actions.last['totalCount'].to_i
          print("totalCount ",totalCount,"\n")
          if(totalCount==0)
            score = 0
          else
            score = ((totalCount-failCount)*100/totalCount).floor
          end
        end
      end
      return score
    end

    def watch_test_server url_server, proxy, job
      score = score(url_server,proxy,job)
      print("score ",score,"\n")
      colour = Colour::Colour.new(score)
      print("colour : ",colour.hex.gsub("#", ""),"\n")
      colour!(colour)
    end

 end
end