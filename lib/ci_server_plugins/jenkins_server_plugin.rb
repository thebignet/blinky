require "crawler/net_http"
require "net/http"

module Blinky
  module JenkinsServer
    def score(jobJsonUrl, proxy_host=nil, proxy_port=80, proxy_user = nil, proxy_pass = nil)
      if(proxy_host=-nil)
        c = Crawler::NetHttp.new(proxy_host, proxy_port, nil, nil)
        json = c.request_response(jobJsonUrl).body;
      else
        json = Net::HTTP.get(jobJsonUrl)
      end
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
 end
end