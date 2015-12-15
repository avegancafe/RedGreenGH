require 'sinatra'
require 'json'



post '/' do
  @payload = JSON.parse(params[:payload])

  puts "The url: #{@payload["repository"]["git_url"]}"
  # puts JSON.pretty_generate(@payload)
  puts `rm -rf #{@payload["repository"]["name"]}`
  puts `git clone #{@payload["repository"]["git_url"]}`
  puts `cd #{@payload["repository"]["name"]} && npm install && gulp test`
end

