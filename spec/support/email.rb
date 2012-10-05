require 'email-spec'

RSpec.configure do |config|
  config.include(EmailSpec::Helpers)

  config.before do
    ActionMailer::Base.deliveries.clear
  end
end
