require File.join(File.dirname(__FILE__), '..', '/spec_helper')
require 'ci_server_plugins/jenkins_server_plugin'
module Blinky

  class StubBlinky
  end

  describe "TestJenkinsServer" do

    before(:each) do
      @blinky = StubBlinky.new
      @blinky.extend(JenkinsServer)
    end

    it "get score with url and proxy" do
      @blinky.should_receive(:score).with("SOME_URL", nil)
      @blinky.stub(:score){100}
      @blinky.should_receive(:colour!)
      @blinky.watch_test_server("SOME_URL", nil)
    end

  end  
end