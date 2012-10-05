creation_step = /^I\screate\sa\sticket
  (?:\swith\sthe\stitle\s"(.*?)"\sand\sthe\sdescription\s"([^"]*)"
    (?:((?:\sand\sthe\sattachment\s"(?:[^"]*)"\sfor\s"(?:[^"]*)")+)|)
  |)$/x

When creation_step do |title, description, file_group|
  click_link 'New Ticket' unless first(:xpath, "//a[text()='New Ticket']").nil?
  if title and description
    fill_in 'Title', with: title
    fill_in 'Description', with: description
  end

  if file_group
    groups = file_group.scan(/ and the attachment "([^"]*)" for "([^"]*)"/)
    groups.each do |file, field|
      attach_file field, Rails.root.join(file)
      click_link 'Add another file'
    end
  end

  click_button 'Create Ticket'
end

Then /^I should be told that the description is too short$/ do
  page.should have_content('Description is too short')
end

Given /^that project has a ticket(?: created by "(.*?)"|):$/ do |user, table|
  table.hashes.each do |attributes|
    ticket = @project.tickets.build(attributes)
    if user
      ticket.user = User.find_by_email!(user)
      ticket.save
    end
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

When /^I navigate to the "([^"]*)" ticket page$/ do |name|
  click_link name
end

When /^I rename the "([^"]*)" ticket to "([^"]*)"$/ do |name, new_name|
  click_link name
  click_link 'Edit Ticket'
  fill_in :Name, with: new_name
  click_button 'Update Ticket'
end

Then /^I should be shown the ticket with the attachment "(.*?)"$/ do |file|
  within('#ticket .assets') { page.should have_content file }
end
