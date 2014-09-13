require "net/http"
require "open-uri"

module Crawler
  class Crawler
    def request_response(uri_str, proxy = nil, limit = 10)
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
    def score(jobJsonUrl, proxy = nil)
      json = request_response(jobJsonUrl,proxy)
      testAppli = JSON.parse(json);
      score = 0
      if(!testAppli['color'].start_with?('red'))
        for i in 0..1
          if(testAppli['healthReport'][i]['description'].start_with?('Test Result'))
           score = testAppli['healthReport'][i]['score'];
         end
       end
     end
     return score
   end

   def watch_test_server url
      score = score(url,nil)
      puts score
      # get colour(score)
      # set colour
    end

  end
end

