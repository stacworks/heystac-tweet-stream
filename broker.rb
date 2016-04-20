require 'rubygems'
require 'twitter'
require 'pusher'

query = ENV['TWITTER_QUERY']
client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
  config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
  config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
  config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
end

puts "Setup and waiting for tweets matching '#{query}'..."

client.filter(:track => query) do |object|

  begin
    case object
    when Twitter::Tweet
      puts object.id

      Pusher['main'].trigger('tweet:receive', object.attrs)
    else
      puts "Unknown type #{object.class}"
    end
  rescue Pusher::Error
    puts "Error trying to publish Tweet."
  end

end
