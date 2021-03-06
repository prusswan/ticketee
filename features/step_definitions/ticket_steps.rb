creation_step = /^I\screate\sa\sticket
  (?:\swith\sthe\stitle\s"(.*?)"\sand\sthe\sdescription\s"([^"]*)"
    (?:((?:\sand\sthe\sattachment\s"(?:[^"]*)"\sfor\s"(?:[^"]*)")+)|)
    (?:(?:\sand\sthe\stag[s|]\s"([^"]*)")|)
  |)$/x

When creation_step do |title, description, file_group, tags|
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

  fill_in 'Tags', with: tags if tags

  click_button 'Create Ticket'
end

Then /^I should be told that the description is too short$/ do
  page.should have_content('Description is too short')
end

Given /^that project has a ticket(?: created by "(.*?)"|):$/ do |user, table|
  table.hashes.each do |attributes|
    tags = attributes.delete("tags")
    state = attributes.delete("state")
    attributes.merge!(:user => User.find_by_email!(user))
    ticket = @project.tickets.create!(attributes)
    ticket.state = State.find_or_create_by_name(state) if state
    ticket.tag!(tags) if tags
    ticket.save
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

When /^I navigate to the "([^"]*)" (?:ticket|tag) page$/ do |name|
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

Then /^I should be shown the ticket with the tag "(.*?)"$/ do |tag|
  within('#ticket #tags') { page.should have_content tag }
end

When /^I delete the tag "(.*?)"$/ do |tag|
  click_link "delete-#{tag}"
end

Then /^I should not be shown the tag "(.*?)"$/ do |tag|
  page.should_not have_content tag
end

When /^I search for the (.*?) "(.*?)"$/ do |category, tag|
  fill_in 'Search', with: "#{category}:#{tag}"
  click_button 'Search'
end

Then /^I should( not)? be shown the watcher "(.*?)"$/ do |negate, watcher|
  unless negate
    within('#watchers') { page.should have_content(watcher) }
  else
    within('#watchers') { page.should_not have_content(watcher) }
  end
end

Then /^I (start|stop) watching the ticket$/ do |status|
  if status == 'start'
    click_button 'Watch this ticket'
  else
    click_button 'Stop watching this ticket'
  end
end

Given /^there are (\d+) tickets for this project$/ do |number|
  number.to_i.times do |i|
    @project.tickets.create!(:title => "Test", :description => "Placeholder ticket.", :user => @user)
  end
end

Then /^I should see (\d+) pages of pagination$/ do |number|
  pages = all(".pagination .page")
  pages.count.should eql(number.to_i)
end

When /^I navigate to the next page$/ do
  within('.pagination .next') { click_link 'Next'}
end

Then /^I see page (\d+) of tickets for this project$/ do |number|
  current_page = find(".pagination .current").text.strip
  current_page.should eql(number)
end
