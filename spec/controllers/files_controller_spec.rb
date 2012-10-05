require 'spec_helper'

describe FilesController do
  let(:good_user) { FactoryGirl.create(:confirmed_user) }
  let(:bad_user) { FactoryGirl.create(:confirmed_user) }

  let(:project) { FactoryGirl.create(:project) }
  let(:ticket) { FactoryGirl.create(:ticket, :project => project, :user => good_user) }

  let(:path) { Rails.root + "spec/fixtures/speed.txt" }
  let(:asset) { ticket.assets.create(:asset => File.open(path)) }

  before do
    permission = good_user.permissions.create!(action: "view")
    permission.update_attribute(:thing, project)
  end

  context "users with access" do
    before do
      sign_in(:user, good_user)
    end

    it "can access assets in a project" do
      get 'show', :id => asset.id
      response.body.should eql(File.read(path))
    end
  end

  context "users without access" do
    before do
      sign_in(:user, bad_user)
    end

    it "cannot access assets in this project" do
      get 'show', :id => asset.id
      response.should redirect_to(root_path)
      flash[:alert].should eql("The asset you were looking for could not be found.")
    end
  end
end
