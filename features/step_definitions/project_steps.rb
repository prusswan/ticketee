Given /^I am on the homepage$/ do
  visit root_path
end

When /^I create a project called "([^"]*)"$/ do |name|
  click_link 'New Project'
  fill_in :Name, with: name
  click_button 'Create Project'
end

Then /^I should be informed that the project has(|\snot) been ([^\"]*)$/ do |flag, action|
  page.should have_content("Project has#{flag} been #{action}.")
end

Then /^I should(|\snot) be on the project page for "([^"]*)"$/ do |flag, name|
  if flag.length == 0
    current_path.should == project_path(Project.find_by_name!(name))
    page.should have_content("#{name} - Projects - Ticketee")
  else
    current_path.should == projects_path
    page.should_not have_content("#{name} - Projects - Ticketee")
  end
end

When /^I try to create a project without a name$/ do
  click_link 'New Project'
  click_button 'Create Project'
end

Then /^I should be told that the name is required$/ do
  page.should have_content("Name can't be blank")
end

Given /^there is a project called "([^\"]*)"$/ do |name|
  FactoryGirl.create(:project, name: name)
end

When /^I navigate to the "([^"]*)" project page$/ do |name|
  click_link name
end

When /^I rename the "([^"]*)" project to "([^"]*)"$/ do |name, new_name|
  click_link name
  click_link 'Edit Project'
  fill_in :Name, with: new_name
  click_button 'Update Project'
end

When /^I delete the project called "([^"]*)"$/ do |name|
  click_link name
  click_link 'Delete Project'
end
