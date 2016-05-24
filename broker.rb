require 'twitter'
require 'pusher'

query = ENV['TWITTER_QUERY']

$pusher = Pusher::Client.new(
  app_id: ENV['PUSHER_APP_ID'],
  key: ENV['PUSHER_KEY'],
  secret: ENV['PUSHER_SECRET'],
  cluster: ENV['PUSHER_CLUSTER']
)

$client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
  config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
  config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
  config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
end

def publish(tweet)
  $pusher.trigger('main', 'tweet:receive', tweet.attrs)
end

$client.filter(:track => query) do |object|

  begin
    case object
    when Twitter::Tweet
      publish(object)
    else
      puts "Unknown type #{object.class}"
    end
  rescue Pusher::Error
    puts "Error trying to publish Tweet."
  end

end
