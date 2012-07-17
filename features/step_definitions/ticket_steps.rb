When /^I create a ticket with the title "(.*?)" and the description "(.*?)"$/ do |title, description|
  click_link 'New Ticket'
  fill_in 'Title', with: title
  fill_in 'Description', with: description
  click_button 'Create Ticket'
end

Then /^I should be told that the description is too short$/ do
  page.should have_content('Description is too short')
end
