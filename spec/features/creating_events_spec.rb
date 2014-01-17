require 'spec_helper'

feature 'Creating Events' do
    before do
        visit '/'

        click_link 'New Event'
    end

  scenario "can create an event" do
    fill_in 'Name', with: "Hack Day"
    fill_in 'Description', with: "Dev Hack-a-thon"
    click_button 'Create Event'

    expect(page).to have_content('Event has been created.')

    event  = Event.where(name: 'Hack Day').first

    expect(page.current_url).to eql(event_url(event))

    title = 'Hack Day : Events : CHNO'

    expect(page).to have_title(title)
  end

  scenario "cannot create an event without a name" do
    click_button 'Create Event'

    expect(page).to have_content("Event has not been created.")
    expect(page).to have_content("Name can't be blank")

  end
end