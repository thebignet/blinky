require "crawler/net_http"
require "net/http"

module Blinky
  module JenkinsServer
    def score(jobJsonUrl, proxy = nil)
      json = Crawler.request_response(jobJsonUrl,proxy)
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
      colour(colour)

      puts "BUILDING!"
      building!
      sleep(2)
      puts "-"

      puts "BUILD FAILED!"
      failure!
      sleep(2)
      puts "-"

      puts "BUILDING!\n"
      building!
      sleep(2)
      puts "-"

      puts "WARNING!\n"
      warning!
      sleep(2)
      puts "-"

      puts "BUILDING!\n"
      building!
      sleep(2)
      puts "-"

      puts "BUILD PASSED!\n"
      success!
      sleep(2)
      puts "-"

      puts "TEST OVER\n"
      off!

    end

 end
end