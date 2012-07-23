Given /^I have run the seed task$/ do
  load Rails.root + "db/seeds.rb"
end

Given /^I am on the homepage$/ do
  visit root_path
end

When /^I navigate to the homepage$/ do
  click_link 'Ticketee'
end

Then /^I should be informed that the( admin)? ([^"]*) has(|\snot) been ([^\"]*)(?: by "(.*?)"|)$/ do |admin, model, negate, action, user|
  unless user
    page.should have_content("#{model.capitalize} has#{negate} been #{action}.")
    page.should have_content("(Admin)") if admin
  else
    page.body.should match(%r{#{action} by #{user}}i)
  end
end

Then /^I should be told that(?: both| the|) ([^"]*) (?:is|are) required$/ do |attributes|
  attributes.gsub(/ (and|the)(?= )/, " ").split.each do |attribute|
    page.should have_content("#{attribute.capitalize} can't be blank")
  end
end

When /^I delete the (.+) called "([^"]*)"$/ do |model, name|
  click_link name
  click_link "Delete #{model.capitalize}"
  page.driver.browser.switch_to.alert.accept if Capybara.current_driver == :selenium
end

Then /^I should not see the "(.*?)" element$/ do |css|
  page.should_not have_css(css), "Expected to not see the #{css} element, but did."
end
