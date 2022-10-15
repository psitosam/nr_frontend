require 'rails_helper'

RSpec.describe TweetFacade do 
  it "calls the backend service to get tweets by topic" do 
    response_body = File.read("spec/fixtures/nasa_query.json")
    stub_request(:get, "https://hidden-woodland-25489.herokuapp.com/api/v1/tweets/?query=nasa").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v2.6.0'
           }).
         to_return(status: 200, body: response_body, headers: {})

    results_array = TweetFacade.get_stored_tweets("nasa")
    results_array.each do |result|
      expect(result.text.downcase).to include("nasa").or include("mars").or include("gamma ray burst")
    end
  end 
end 