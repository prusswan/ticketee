When /^I create a ticket with the title "(.*?)" and the description "(.*?)"$/ do |title, description|
  click_link 'New Ticket'
  fill_in 'Title', with: title
  fill_in 'Description', with: description
  click_button 'Create Ticket'
end

Then /^I should be told that the description is too short$/ do
  page.should have_content('Description is too short')
end

Given /^that project has a ticket:$/ do |table|
  table.hashes.each do |attributes|
    @project.tickets.create!(attributes)
  end
end

Then /^I should( not)? be shown the ticket "(.*?)"$/ do |negate, ticket|
  unless negate
    page.should have_content(ticket)
  else
    page.should_not have_content(ticket)
  end
end

Then /^I should( not)? be on the ticket page for "([^"]*)"$/ do |negate, title|
  unless negate
    ticket = Ticket.find_by_title!(title)
    current_path.should == project_ticket_path(ticket.project, ticket)
    within('#ticket h2') { page.should have_content(title) }
    page.should have_content(ticket.description.strip)
  else
    page.should_not have_content(title)
  end
end

When /^I navigate to the homepage$/ do
  click_link 'Ticketee'
end
