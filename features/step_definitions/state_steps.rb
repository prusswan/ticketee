When /^I create a comment with the text "([^"]*)"(?: and the state "([^"]*)"|)$/ do |comment, state|
  fill_in :text, with: comment
  select state, from: 'State' if state
  click_button 'Create Comment'
end

Then /^I should be shown the comment "([^"]*)"(?: with the state "([^"]*)"|)$/ do |comment, state|
  within('#comments') { page.should have_content comment }
  if state
    within('#ticket') { page.should have_content state }
  end
end

Given /^there is a state called "([^"]*)"$/ do |name|
  State.create!(:name => name)
end

Then /^I should be shown the state "(.*?)"$/ do |state|
  within('#comment_state_id') { page.should have_content state }
end

Then /^I should be shown comments containing the state "(.*?)"$/ do |state|
  within('#comments') { page.should have_content state }
end

When /^I navigate to the states page$/ do
  click_on 'Admin'
  click_on 'States'
end

When /^I create a state called "(.*?)"$/ do |name|
  click_on 'New State'
  fill_in 'Name', with: name
  click_button 'Create State'
end
