require 'twitter'
require 'sinatra'

query = ENV['TWITTER_QUERY']
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
  config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
  config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
  config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
end

get '/' do
  @tweets = client.search(query).take(10)

  erb :index
end
