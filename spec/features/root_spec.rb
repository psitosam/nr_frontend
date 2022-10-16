require 'rails_helper'

RSpec.describe 'the root page' do 
  it 'displays the title of the app' do 
    visit root_path
    expect(page).to have_content("Show Me Tweets")
  end 

  it 'asks user what topic they would like to see' do 
    visit root_path
    expect(page).to have_content("What topic would you like to see?")
  end 

  it 'has links to each of the three topics' do 
    visit root_path
    expect(page).to have_link("Healthcare")
    expect(page).to have_link("Nasa")
    expect(page).to have_link("Open Source")
  end 

  it 'healthcare link takes user to healthcare tweets page' do 
    response_body = File.read("spec/fixtures/healthcare_query.json")
    stub_request(:get, "https://hidden-woodland-25489.herokuapp.com/api/v1/tweets/?query=healthcare").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v2.6.0'
           }).
         to_return(status: 200, body: response_body, headers: {})

    visit root_path
    click_link("Healthcare")
    expect(current_path).to eq searches_path
    expect(page).to have_content("Recent tweets for: healthcare")
    expect(page).to have_content("RT @AmoneyResists: Herschel Walker: “Americans should get off of government healthcare and get on the healthcare that U.S. senators have.”…")
  end 

  it 'nasa link takes user to nasa tweets page' do
    response_body = File.read("spec/fixtures/nasa_query.json")
    stub_request(:get, "https://hidden-woodland-25489.herokuapp.com/api/v1/tweets/?query=nasa").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v2.6.0'
           }).
         to_return(status: 200, body: response_body, headers: {})

    visit root_path
    click_link("Nasa")
    expect(current_path).to eq searches_path
    expect(page).to have_content("RT @Fact: NASA once banned beans because astronaut farts could cause sudden fires on a spacecraft.")
  end

  it 'opensource link takes user to opensource tweets page' do
    response_body = File.read("spec/fixtures/opensource_query.json")
    stub_request(:get, "https://hidden-woodland-25489.herokuapp.com/api/v1/tweets/?query=opensource").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v2.6.0'
           }).
         to_return(status: 200, body: response_body, headers: {})

    visit root_path
    click_link("Open Source")
    expect(current_path).to eq searches_path
    expect(page).to have_content("RT @ManavGambhir11: An amazing session to attend.Learnt about whatnot, from opensource to web3, I got to know about all. An amazing opportu…")
  end
end 