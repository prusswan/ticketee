require 'spec_helper'

feature "Editing tickets" do
  let!(:project) { FactoryGirl.create(:project) }
  let!(:user) { FactoryGirl.create(:confirmed_user) }
  let!(:ticket) { FactoryGirl.create(:ticket, :project => project, :user => user) }

  before do
    define_permission!(user, "view", project)
    sign_in_as!(user)
    visit '/'
    within('#projects') { click_link project.name }
    click_link ticket.title
    click_link "Edit Ticket"
  end

  scenario "Updating a ticket" do
    fill_in "Title", :with => "Make it really shiny!"
    click_button "Update Ticket"
    page.should have_content "Ticket has been updated."
    within("#ticket h2") do
      page.should have_content("Make it really shiny!")
    end
    page.should_not have_content ticket.title
  end

  scenario "Updating a ticket with invalid information" do
    fill_in "Title", :with => ""
    click_button "Update Ticket"
    page.should have_content("Ticket has not been updated.")
  end
end
