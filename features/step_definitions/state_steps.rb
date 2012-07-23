creation_step = /^I create a comment with the text "([^"]*)"(?: and the state "([^"]*)"|)(?: and the tag "([^"]*)"|)$/

When creation_step do |comment, state, tag|
  fill_in :text, with: comment
  select state, from: 'State' if state and not first('comment_state_id').nil?
  fill_in 'Tags', with: tag unless tag.nil?
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

When /^I follow "(.*?)" for the "(.*?)" state$/ do |link, name|
  state = State.find_by_name!(name)
  within("#state_#{state.id}") { click_on link }
end

Then /^I should be informed that "(.*?)" is now the default state$/ do |state|
  page.should have_content "#{state} is now the default state."
end
