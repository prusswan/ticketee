When /^I create a project called "([^"]*)"$/ do |name|
  click_link 'New Project'
  fill_in :Name, with: name
  click_button 'Create Project'
end

Then /^I should( not)? be shown the project "(.*?)"$/ do |negate, project|
  unless negate
    page.should have_content project
  else
    page.should_not have_content project
  end
end

Then /^I should( not)? be on the project page for "([^"]*)"$/ do |negate, name|
  unless negate
    current_path.should == project_path(Project.find_by_name!(name))
    page.should have_content("#{name} - Projects - Ticketee")
  else
    current_path.should == projects_path
    page.should_not have_content("#{name} - Projects - Ticketee")
  end
end

Given /^there is a project called "([^\"]*)"$/ do |name|
  @project = FactoryGirl.create(:project, name: name)
end

When /^I navigate to the "([^"]*)" project page$/ do |name|
  within('#projects') { click_link name }
end

When /^I rename the "([^"]*)" project to "([^"]*)"$/ do |name, new_name|
  click_link name
  click_link 'Edit Project'
  fill_in :Name, with: new_name
  click_button 'Update Project'
end
