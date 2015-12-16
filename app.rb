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
  puts `rm -rf #{@payload["repository"]["name"]}`
  puts `git clone #{@payload["repository"]["git_url"]}`
  puts "the name of the repo is: #{@payload["repository"]["name"]}"
  # puts JSON.pretty_generate(@payload)
  puts `cd #{@payload["repository"]["name"]};`
  puts (res = `gulp test`)
  yellow.off
  if res =~ /0\sfailures/
      green.on
      sleep 10
      green.off
  else
      red.on
      sleep 10
      red.off
  end
end

