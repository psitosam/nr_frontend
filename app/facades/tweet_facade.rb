class TweetFacade
  def self.get_stored_tweets(topic)
    data = BackendService.get_tweets_by_topic(topic)[:data]
    data.map do |tweet_data|
      Tweet.new(tweet_data)
    end
  end
end