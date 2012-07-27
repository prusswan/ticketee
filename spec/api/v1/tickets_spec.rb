require 'spec_helper'

describe "/api/v1/tickets", :type => :api do
  let(:project) { FactoryGirl.create(:project, :name => "Ticketee") }

  before do
    @user = create_user!(admin: true)
    @user.permissions.create!(:action => "view", :thing => project)
  end

  let(:token) { @user.authentication_token }

  context "index" do
    before do
      5.times { FactoryGirl.create(:ticket, :project => project, :user => @user) }
    end

    let(:url) { "/api/v1/projects/#{project.id}/tickets" }

    it "XML" do
      get "#{url}.xml", :token => token
      last_response.body.should eql(project.tickets.to_xml)
    end

    it "JSON" do
      get "#{url}.json", :token => token
      last_response.body.should eql(project.tickets.to_json)
    end
  end
end
