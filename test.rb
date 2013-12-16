require 'rubygems'
require 'blinky'

blinky = Blinky.new
light_one = blinky.lights[0]
light_two = blinky.lights[1]

light_one.where_are_you?
#light_one.off!
#light_one.warning!
#light_one.success!
