require 'colormath'

module Colour
  class Colour
    @colour
    def initialize(score=0)
      @score = score
      saturation=1.0
      luminance=0.5
      if(score>0 && score<100)
        failed = ColorMath::HSL.new(21, saturation, luminance)
        ok = ColorMath::HSL.new(127, saturation, luminance)
        ratio = score*1.0/100.0
        #print("ratio : ",ratio,"\n")
        hue = (ok.hue-failed.hue)*ratio+failed.hue
        @colour = ColorMath::HSL.new(hue, saturation, luminance)
        #print("hue : ",colour.hue,"\n")
      elsif score==0
        @colour = ColorMath::HSL.new(0, saturation, luminance)
      elsif score==100
        @colour = ColorMath::HSL.new(222, saturation, luminance)
      else
        @colour = ColorMath::HSL.new(0, saturation, 1.0)
      end
    end
    def hex
      @colour.hex
    end
  end
end

