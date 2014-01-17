require 'spec_helper'

feature "Viewing projects" do 
  before do
    event_1 = FactoryGirl.create(:event, name: "Demo Hack")
    FactoryGirl.create(:project, 
                        event: event_1,
                        title: "Demo project",
                        description: "Best. Project. Ever.")

    event_2 = FactoryGirl.create(:event, name: "Hacker's Hack")
    FactoryGirl.create(:project,
                        event: event_2,
                        title: "Example project",
                        description: "This is an exmaple")

    visit '/'
  end

  scenario 'when viewing projects for a given event' do
    click_link 'Demo Hack'

    expect(page).to have_content("Demo project")
    expect(page).to_not have_content("Example project")

    click_link 'Demo project'

    puts page.body
    within('#project h2') do
      expect(page).to have_content("Demo project")
    end

    expect(page).to have_content("Best. Project. Ever.")
  end

end