module Blinky
  module DreamCheeky
    module WebmailNotifier

      def success!
        colourRGB!("00FF00")
      end

      def failure!
        colourRGB!("FF0000")
      end

      def building! 
        colourRGB!("0000FF")
      end

      def warning!
        colourRGB!("FF2A00")
      end

      def off!
        colourRGB!("000000")
      end

      def init
        send "\x1f\x02\x00\x2e\x00\x00\x2b\x03"
        send "\x00\x02\x00\x2e\x00\x00\x2b\x04"
        send "\x00\x00\x00\x2e\x00\x00\x2b\x05"
      end

      def colour!(colour)
        send(colour + "\x00\x00\x00\x00\x05")  
      end

      def colourRGB!(colour)
        colour!(colour.scan(/../).map(&:hex).map(&:chr).join)
      end

      private
      def send(data)
        @handle.usb_control_msg(0x21, 0x09, (3 << 8) | 1, 0, data, 0)
      end

    end     
  end
end