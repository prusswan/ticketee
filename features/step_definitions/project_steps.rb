Given /^I am on the homepage$/ do
  visit root_path
end

When /^I create a project called "([^"]*)"$/ do |name|
  click_link 'New Project'
  fill_in :Name, with: name
  click_button 'Create Project'
end

Then /^I should be shown the message for project creation$/ do
  page.should have_content("Project has been created.")
end

Then /^I should be on the project page for "([^"]*)"$/ do |name|
  current_path.should == project_path(Project.find_by_name!(name))
  page.should have_content("#{name} - Projects - Ticketee")
end

When /^I try to create a project without a name$/ do
  click_link 'New Project'
  click_button 'Create Project'
end

Then /^I should be informed that the project has not been created$/ do
  page.should have_content("Project has not been created.")
end

Then /^I should be told that the name is required$/ do
  page.should have_content("Name can't be blank")
end
