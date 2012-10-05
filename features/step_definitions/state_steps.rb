When /^I create a comment with the text "(.*?)"$/ do |comment|
  fill_in :text, with: comment
  click_button 'Create Comment'
end

Then /^I should be shown the comment "(.*?)"$/ do |comment|
  within('#comments') { page.should have_content comment }
end
