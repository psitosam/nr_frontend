require 'rails_helper'

RSpec.describe BackendService do 
  it '#get_all_tweets' do 
    response_body = File.read('spec/fixtures/index_query.json')
    stub_request(:get, "https://hidden-woodland-25489.herokuapp.com/tweets").
      with(
        headers: {
       	'Accept'=>'*/*',
       	'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	'User-Agent'=>'Faraday v2.6.0'
        }).
    to_return(status: 200, body: response_body, headers: {})


    test = BackendService.get_all_tweets
    
    # Checking for shape and completeness of response:
    expect(test[:data]).to be_a(Array)
    expect(test[:data].length).to eq(30)
    response_array = (test[:data])
    response_array.each do |tweet|
      expect(tweet).to have_key(:id)
      expect(tweet[:id]).to be_a(Integer)
      expect(tweet).to have_key(:attributes)
      expect(tweet[:attributes]).to be_a(Hash)
      expect(tweet[:attributes]).to have_key(:created_at)
      expect(tweet[:attributes][:created_at]).to be_a(String)
      expect(tweet[:attributes]).to have_key(:text)
      expect(tweet[:attributes][:text]).to be_a(String)
      expect(tweet[:attributes]).to have_key(:edit_history_tweet_ids)
      expect(tweet[:attributes][:edit_history_tweet_ids]).to be_a(Array)
    end
  end 
end 