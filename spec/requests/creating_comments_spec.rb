require 'spec_helper'

feature "Creating comments" do
  let!(:user) { FactoryGirl.create(:confirmed_user) }
  let!(:project) { FactoryGirl.create(:project) }
  let!(:ticket) { FactoryGirl.create(:ticket, :project => project, :user => user) }

  before do
    define_permission!(user, "view", project)
    FactoryGirl.create(:state, :name => "Open")
    FactoryGirl.create(:state, :name => "Closed")

    sign_in_as!(user)
    visit '/'
    within('#projects') { click_link project.name }
    click_link ticket.title
  end

  scenario "Creating a comment" do
    fill_in "Text", :with => "Added a comment!"
    click_button "Create Comment"
    page.should have_content("Comment has been created.")
    within("#comments") do
      page.should have_content("Added a comment!")
    end
  end

  scenario "Creating an invalid comment" do
    click_button "Create Comment"
    page.should have_content("Comment has not been created.")
    page.should have_content("Text can't be blank")
  end

  scenario "Changing a ticket's state" do
    fill_in "Text", :with => "This is a real issue"
    select "Open", :from => "State"
    click_button "Create Comment"
    page.should have_content("Comment has been created.")
    within("#ticket .state") do
      page.should have_content("Open")
    end
    within("#comments") do
      page.should have_content("State: Open")
    end

    fill_in "Text", :with => "Closing the issue"
    select "Closed", :from => "State"
    click_button "Create Comment"
    within("#ticket .state") do
      page.should have_content("Closed")
    end
    within("#comments") do
      page.should have_css('.state_open')
      page.should have_css('.state_closed')
    end
  end
end
