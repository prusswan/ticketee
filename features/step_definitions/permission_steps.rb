permission_step = /^"(.*?)" can ([^"]*?) ([o|i]n)?\s?the "(.*?)" project$/

Given permission_step do |user, permission, on, project|
  create_permission(user, find_project(project), permission)
end

def create_permission(email, object, action)
  permission = Permission.create!(action: action)
  permission.update_attribute(:user, User.find_by_email!(email))
  permission.update_attribute(:thing, object)
end

def find_project(name)
  Project.find_by_name!(name)
end

When /^I view the permissions for the user "(.*?)"$/ do |user|
  click_on user
  click_on 'Permissions'
end

When /^I enable "(.*?)" for the project "(.*?)"$/ do |action, name|
  project = Project.find_by_name!(name)
  permission = action.downcase.gsub(" ", "_")
  field_id = "permissions_#{project.id}_#{permission}"
  check field_id
  click_button 'Update'
end
