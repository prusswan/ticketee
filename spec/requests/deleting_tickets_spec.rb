require 'spec_helper'

feature 'Deleting tickets' do
  let!(:project) { FactoryGirl.create(:project) }
  let!(:user) { FactoryGirl.create(:confirmed_user) }
  let!(:ticket) { FactoryGirl.create(:ticket, :project => project, :user => user) }

  before do
    define_permission!(user, "view", project)
    sign_in_as!(user)
    visit '/'
    within('#projects') { click_link project.name }
    click_link ticket.title
  end

  scenario "Deleting a ticket" do
    click_link "Delete Ticket"
    page.should have_content("Ticket has been deleted.")
    page.current_url.should == project_url(project)
  end
end
