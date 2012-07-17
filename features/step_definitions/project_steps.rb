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
