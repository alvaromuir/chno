require 'spec_helper'

feature "Viewing events" do
  scenario "Listing all events" do
    event = FactoryGirl.create(:event, name: "Demo Hack")
    visit '/'
    click_link 'Demo Hack'
    expect(page.current_url).to eql(event_url(event))
  end 
end