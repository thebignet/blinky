= blinky

blinky helps you see the light - plug and play set up for build lights - get a build light up and running in a few minutes.

== Why blinky?

Setting up a build light on a new project always seems to be more of a hassle than it should be. Somehow it always seems that no one else has ever dealt with the exact combination of OS, CI Server and build light that you have in your sweaty little hands, and you have to write something from scratch. Again.

blinky is an attempt to fix that.

blinky aims to supply plug and play support for all combinations of
* USB Light Model (or any other USB Device used to indicate build status)
* Operating System

== How do I use blinky?

Plug in your USB light, and then do something like this
    
  require 'rubygems'
  require 'blinky'

  blinky = Blinky.new.light  
  light.success!
  light.failure!
  light.building!
  light.warning!
  light.off!

== What if I have more than one light? 

Want to plug in more than one light on the same machine? 

   require 'rubygems'
   require 'blinky'

   blinky = Blinky.new
   light_one = blinky.lights[0]
   light_two = blinky.lights[1]

Not sure which light is which?

   # make light_one flash
   light_one.where_are_you?

== What is currently supported?

=== Lights/ Build Indicators
* Delcom Engineering USB Visual Indicator Generation I
* Delcom Engineering USB Visual Indicator Generation II
     
=== Operating Systems
* OSX
* Linux
* Windows 

== How Do I install blinky?

=== 1) Install support for lib-usb-1.0 (http://www.libusb.org)

==== OSX and Linux
    
Install lib-usb-1.0 with your favourite package manager.
    
For example, on OSX:
    
  brew install libusb
  
on Debian or Ubuntu:

  $ sudo apt-get install libusb-1.0-0-dev  

and so on
    
==== Windows
     
Windows can be a bit fiddly. The following is how I got a Delcomm II light to work on a Windows 7 laptop.
Further experience reports/better instructions would be gratefully received.

* installed Zadig (https://github.com/pbatard/libwdi/wiki#wiki-Downloads)
* plugged in the USB light
  * at this point windows 'helpfully' installed an incorrect 'USB Input device' driver
* opened Zadig and selected 'Options -> List All Devices'
* Selected 'USB Input Device' in the Zadig drop-down
* Clicked on 'Replace Driver' and confirmed in the popup dialog
              
=== 2) Install the blinky gem

  gem install blinky
            
=== 3) Test your installation

Plug in your light and then do this:

  require 'rubygems'
  require 'blinky'

  blinky = Blinky.new
  blinky.light.watch_test_server
      
Watch the pretty lights!
  
== How do I contribute support for more lights 

COMING SOON


== Copyright

Copyright (c) 2010 Perryn Fowler. See LICENSE for details.
