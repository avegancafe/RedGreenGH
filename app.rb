require 'sinatra'
require 'json'
require 'pi_piper'
include PiPiper

green = PiPiper::Pin.new(:pin => 18, :direction => :out)
yellow = PiPiper::Pin.new(:pin => 27, :direction => :out)
red = PiPiper::Pin.new(:pin => 9, :direction => :out)


post '/' do
  yellow.on
  @payload = JSON.parse(params[:payload])

  puts "The url: #{@payload["repository"]["git_url"]}"
  # puts JSON.pretty_generate(@payload)
  puts `rm -rf #{@payload["repository"]["name"]}`
  puts `git clone #{@payload["repository"]["git_url"]}`
  yellow.off
  green.on
  puts `cd #{@payload["repository"]["name"]}; npm install;  gulp test`
  sleep 5
  green.off
end

