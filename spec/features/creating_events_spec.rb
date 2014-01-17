require 'spec_helper'

feature 'Creating Events' do
  scenario "can create a hack-a-thon event" do
    visit '/'

    click_link 'New Event'

    fill_in 'Name', with: "Hack Day"
    fill_in 'Description', with: "Dev Hack-a-thon"
    click_button 'Create Event'

    expect(page).to have_content('Event has been created.')
  end
end