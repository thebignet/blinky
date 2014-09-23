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

    it "show blue light with score 100" do
      # Given
      score = 100
      colour = Colour::Colour.new(score)

      # Stub
      allow(@blinky).to receive(:score).and_return(score)
      allow(Colour::Colour).to receive(:new).and_return(colour)

      # Expect
      expect(@blinky).to receive(:score).with("SOME_URL", nil, "SOME_JOB")
      expect(@blinky).to receive(:colour!).with(colour)

      # When
      @blinky.watch_test_server("SOME_URL", nil, "SOME_JOB")
    end

    it "show red light with score 0" do
      # Given
      score = 0
      colour = Colour::Colour.new(score)

      # Stub
      allow(@blinky).to receive(:score).and_return(score)
      allow(Colour::Colour).to receive(:new).and_return(colour)

      # Expect
      expect(@blinky).to receive(:score).with("SOME_URL", nil, "SOME_JOB")
      expect(@blinky).to receive(:colour!).with(colour)

      # When
      @blinky.watch_test_server("SOME_URL", nil, "SOME_JOB")
    end

    it "show green light with score 75" do
      # Given
      score = 75
      colour = Colour::Colour.new(score)

      # Stub
      allow(@blinky).to receive(:score).and_return(score)
      allow(Colour::Colour).to receive(:new).and_return(colour)

      # Expect
      expect(@blinky).to receive(:score).with("SOME_URL", nil, "SOME_JOB")
      expect(@blinky).to receive(:colour!).with(colour)

      # When
      @blinky.watch_test_server("SOME_URL", nil, "SOME_JOB")
    end

    it "show blue lagoon light with score 99" do
      # Given
      score = 99
      colour = Colour::Colour.new(score)

      # Stub
      allow(@blinky).to receive(:score).and_return(score)
      allow(Colour::Colour).to receive(:new).and_return(colour)

      # Expect
      expect(@blinky).to receive(:score).with("SOME_URL", nil, "SOME_JOB")
      expect(@blinky).to receive(:colour!).with(colour)

      # When
      @blinky.watch_test_server("SOME_URL", nil, "SOME_JOB")
    end

    it "show white lagoon light with score -1" do
      # Given
      score = -1
      colour = Colour::Colour.new(score)

      # Stub
      allow(@blinky).to receive(:score).and_return(score)
      allow(Colour::Colour).to receive(:new).and_return(colour)

      # Expect
      expect(@blinky).to receive(:score).with("SOME_URL", nil, "SOME_JOB")
      expect(@blinky).to receive(:colour!).with(colour)

      # When
      @blinky.watch_test_server("SOME_URL", nil, "SOME_JOB")
    end

  end  
end