require 'pi_piper'
include PiPiper

green = PiPiper::Pin.new(:pin => 18, :direction => :out)
yellow = PiPiper::Pin.new(:pin => 27, :direction => :out)
red = PiPiper::Pin.new(:pin => 9, :direction => :out)
green.off
yellow.off
red.off
