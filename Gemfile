source 'https://rubygems.org'

gem 'rails', '~> 3.2.1'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'dynamic_form'
gem 'jquery-rails'

group :test, :development do
  gem 'rspec-rails', '~> 2.5'
  gem 'gmail'
  gem 'sqlite3'
end

group :test do
  gem 'cucumber-rails', require: false
  gem 'capybara'
  gem 'headless'
  gem 'database_cleaner'
  gem 'factory_girl'
  gem 'email_spec'
  gem 'launchy'
end

group :development do
  gem 'guard'
  gem 'guard-cucumber'
  gem 'guard-rspec'
  gem 'guard-shell'
  gem 'capistrano'
  gem 'capistrano_colors'
  gem 'rvm-capistrano'
end

group :production do
  gem 'pg'
end

gem 'devise'
gem 'cancan'

gem 'paperclip'
gem 'searcher'
gem 'kaminari'

gem 'omniauth-twitter'
gem 'omniauth-github'

gem 'delayed_job'
gem 'delayed_job_active_record'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the web server
# gem 'unicorn'
gem 'thin'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
