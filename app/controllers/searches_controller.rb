class SearchesController < ApplicationController

  def index
    if params[:query]
      topic = params[:query]
      @tweets = TweetFacade.get_stored_tweets(topic)
      @topic = topic
    end
  end
end