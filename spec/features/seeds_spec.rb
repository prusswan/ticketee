require 'spec_helper'

feature "Seed Data" do
  scenario "The basics" do
    load Rails.root.join "db/seeds.rb"
    user = User.where(email: "admin@ticketee.com").first!
    project = Project.where(name: "Ticketee Beta").first!
  end
end
