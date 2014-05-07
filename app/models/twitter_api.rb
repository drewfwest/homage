require 'twitter'

module TwitterApi
  class Client

    def initialize(auth)
      @twitter_rest_client = Twitter::REST::Client.new do |config|
        config.consumer_key = ENV['TWITTER_KEY']
        config.consumer_secret = ENV['TWITTER_SECRET']
        config.oauth_token = auth.token
        config.oauth_token_secret = auth.secret
      end
    end
  end

end