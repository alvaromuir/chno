require 'spec_helper'

feature "Editing projects" do
  let!(:event) { FactoryGirl.create(:event)}
  let!(:project) { FactoryGirl.create(:project, event: event) }
  
  before do
    visit '/'
    click_link event.name
    click_link project.title
    click_link "Edit Project"
  end

  scenario "when updating a project" do
    fill_in 'Title', with: "Ambitious Project"
    click_button 'Update Project'

    expect(page).to have_content "Project has been udpated."

    within('#project h2') do
      expect(page).to have_content "Ambitious Project"
    end

    expect(page).to_not have_content project.title
  end

  scenario "when updating a project with invalid info" do
    fill_in 'Title', with: ""
    click_button 'Update Project'

    expect(page).to have_content "Project has not been updated."
  end
end