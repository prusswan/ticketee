require 'spec_helper'

feature "Viewing projects" do
  scenario "Listing all projects" do
    project = FactoryGirl.create(:project, :name => "TextMate 2")
    visit '/'
    click_link 'TextMate 2'
    page.current_url.should == project_url(project)
  end
end
