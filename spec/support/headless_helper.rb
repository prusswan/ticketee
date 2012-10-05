require 'headless'

headless = Headless.new
at_exit do
  headless.destroy
end

RSpec.configure do |config|
  config.before(js: true) do
    headless.start if Capybara.current_driver == :selenium
  end

  config.after(js: true) do
    headless.stop if Capybara.current_driver == :selenium
  end
end
