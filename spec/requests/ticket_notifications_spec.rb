require 'spec_helper'

feature "Ticket Notifications" do
  let!(:alice)   { FactoryGirl.create(:confirmed_user, :email => "alice@example.com") }
  let!(:bob)     { FactoryGirl.create(:confirmed_user, :email => "bob@example.com") }
  let!(:project) { FactoryGirl.create(:project) }
  let!(:ticket)  { FactoryGirl.create(:ticket, project: project, user: alice) }

  before do
    ActionMailer::Base.deliveries.clear

    define_permission!(alice, "view", project)
    define_permission!(bob, "view", project)

    sign_in_as!(bob)
    visit '/'

    within('#projects') { click_link project.name }
    click_link ticket.title
    fill_in "comment_text", :with => "Is it out yet?"
    click_button  "Create Comment"
  end

  scenario "Ticket owner receives notifications about comments" do
    email = find_email!(alice.email)
    subject = "[ticketee] #{project.name} - #{ticket.title}"
    email.subject.should include(subject)
    visit parse_email_for_link(email, 'view this ticket online here')

    within("#ticket h2") do
      page.should have_content(ticket.title)
    end
  end

  scenario "Comment authors are automatically subscribed to a ticket" do
    page.should have_content("Comment has been created.")
    find_email!(alice.email)
    click_link "Sign out"

    reset_mailer

    sign_in_as!(alice)
    within('#projects') { click_link project.name }
    click_link ticket.title
    fill_in "comment_text", :with => "Not yet!"
    click_button "Create Comment"
    page.should have_content("Comment has been created.")
    find_email!(bob.email)
    lambda { find_email!(alice.email) }.should raise_error
  end
end
