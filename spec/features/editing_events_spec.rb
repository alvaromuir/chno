require 'spec_helper'

feature "Editing events" do
  before do
    FactoryGirl.create(:event, name: "Demo Hack")

    visit '/'
    click_link 'Demo Hack'
    click_link 'Edit Event'
  end

  scenario "when updating an event" do
    fill_in 'Name', with: "Real-Time Demo Hack"
    click_button 'Update Event'

    expect(page).to have_content("Event has been updated.")
  end

  scenario "when updating an event with invalid attribs is bad" do
    fill_in 'Name', with: ""
    click_button 'Update Event'

    expect(page).to have_content("Event has not been updated.")
  end
end