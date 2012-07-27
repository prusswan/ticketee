require "spec_helper"

describe Notifier do
  it "correctly sets the reply-to" do
    comment = FactoryGirl.create(:comment)
    Delayed::Worker.new.work_off

    mail = ActionMailer::Base.deliveries.last
    mail.from.should eql(["youraccount+#{comment.project.id}+#{comment.ticket.id}@example.com"])
  end
end
