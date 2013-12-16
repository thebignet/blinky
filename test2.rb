require 'rubygems'
require 'blinky'

blinky = Blinky.new
light = blinky.lights[0]

t1=0.1
t2=t1*5

color = ARGV[0] ? ARGV[0] : "0000FF"

for i in 0..5
	light.colourRGB!(color)
	sleep(t1)
	light.off!
	sleep(t1)
	light.colourRGB!(color)
	sleep(t1)
	light.off!
	sleep(t2)
end
