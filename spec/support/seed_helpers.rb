module SeedHelpers
  def create_user!(attributes={})
    attributes.merge!(confirmed_at: Time.now)
    user = FactoryGirl.create(:user, attributes)
  end
end

RSpec.configure do |config|
  config.include SeedHelpers
end
