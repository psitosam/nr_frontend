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
    visit root_path
    click_link("Healthcare")
  end 
end 