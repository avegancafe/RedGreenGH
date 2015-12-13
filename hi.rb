require 'sinatra'
require 'json'

post '/' do
  @payload = JSON.parse(params[:payload])

  puts @payload["repository"]["git_url"]
end

