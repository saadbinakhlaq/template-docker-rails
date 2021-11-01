require 'active_support/concern'

module TwitterApi
  extend ActiveSupport::Concern

  def twitter_post
    return if self.tweet_id.present?

    tweet = twitter_client.update(self.summary)
    self.update(tweet_id: tweet.id)
  end

  def collect_with_max_id(collection=[], max_id=nil, &block)
    response = yield(max_id)
    collection += response
    response.empty? ? collection.flatten : collect_with_max_id(collection, response.last.id - 1, &block)
  end

  def get_tweets_of_profile(user)
    # collect_with_max_id do |max_id|
    #   options = {count: 5, include_rts: false, exclude_replies: true}
    #   options[:max_id] = max_id unless max_id.nil?
    #   twitter_client.user_timeline(user, options)
    # end

    options = {count: 5, include_rts: false, exclude_replies: true}
    twitter_client.user_timeline(user, options)
  end

  def twitter_client
    Twitter::REST::Client.new do |config|
      config.consumer_key        = "consumer_key"
      config.consumer_secret     = "consumer_secret"
      config.access_token        = "access_token"
      config.access_token_secret = "access_token_secret"
    end
  end
end
