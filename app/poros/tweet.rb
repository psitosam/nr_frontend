class Tweet 
  attr_reader :id, :text, :created_at, :edit_history_tweet_ids, :lang, :subject

  def initialize(data)
    @text = data[:attributes][:text]
    @created_at = data[:attributes][:created_at]
    @edit_history_tweet_ids = data[:attributes][:edit_history_tweet_ids]
    @lang = data[:attributes][:lang]
    @subject = data[:attributes][:subject]
  end 
end