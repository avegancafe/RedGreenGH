require 'sinatra'
require 'json'


def process_pull_request(pull_request)
  puts JSON.pretty_generate(pull_request)
end

post '/' do
  @payload = JSON.parse(params[:payload])

  puts @payload["repository"]["git_url"]
end

