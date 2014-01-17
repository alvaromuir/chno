require 'spec_helper'

feature "Deleting events" do
  before do
    FactoryGirl.create(:event, name: "Demo Hack")

    visit '/'
    click_link 'Demo Hack'
  end
  scenario "when deleting an event" do
    click_link 'Delete Event'

    expect(page).to have_content("Event has been destroyed.")

    visit '/'

    expect(page).to have_no_content('Demo Hack')
  end
end