require 'spec_helper'

feature 'Deleting Projects' do
  let!(:event) { FactoryGirl.create(:event)}
  let!(:project) { FactoryGirl.create(:project, event: event) }

  before do
    visit '/'
    click_link event.name
    click_link project.title
  end

  scenario "when deleting a project" do
    click_link 'Delete Project'
    expect(page).to have_content("Project has been deleted.")
    expect(page.current_url).to eq(event_url(event))
  end
end
