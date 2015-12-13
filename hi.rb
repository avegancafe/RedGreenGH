require 'sinatra'
require 'json'



post '/' do
  @payload = JSON.parse(params[:payload])

  puts "The url: #{@payload["repository"]["git_url"]}"
  puts JSON.pretty_generate(@payload)
end

