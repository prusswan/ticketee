Given /^"(.*?)" can view the "(.*?)" project$/ do |user, project|
  permission = Permission.create!(:action => "view")
  permission.update_attribute(:user, User.find_by_email!(user))
  permission.update_attribute(:thing, Project.find_by_name!(project))
end
