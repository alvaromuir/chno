require 'spec_helper'

feature "Creating Projects" do
  before do
    FactoryGirl.create(:event, name: "Hack Pactice")
    visit '/'
    click_link 'Hack Pactice'
    click_link 'New Project'
  end

  scenario "when creating a project" do
    fill_in 'Title', with: "Unique WebApp Idea"
    fill_in 'Description', with: "Connecting people via social"

    click_button 'Create Project'

    expect(page).to have_content("Project has been created.")
  end
  
  scenario "when creating a project without valid attributes it fails" do
    click_button 'Create Project'
    expect(page).to have_content("Project has not been created.")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Description can't be blank")
  end 

  scenario "must have decriptions longer than 10 characters" do
    fill_in 'Title', with: "Pascal Web Framework"
    fill_in 'Description', with: "Why not?"
    click_button 'Create Project'

    expect(page).to have_content("Project has not been created.")
    expect(page).to have_content("Description is too short")
  end
end