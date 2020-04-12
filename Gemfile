source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.2'

gem 'bootstrap-sass'
gem 'sprockets'
gem 'faker'
gem 'will_paginate'
gem 'bootstrap-will_paginate'
gem 'travis'

# these gems are for users profile pic
gem 'carrierwave'
gem 'mini_magick'

gem 'database_cleaner'
gem 'email_validator'
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', group: :doc


# Use ActiveModel has_secure_password
gem 'bcrypt'
gem 'active_model_serializers'
gem 'active_hash_relation'
gem 'pundit'
gem 'jwt'
gem 'simple_command'
gem 'responders'
gem 'bootsnap', require: false

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'rspec-rails'
  gem 'factory_girl_rails'

end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  gem 'selenium-webdriver'
  gem 'capybara'
  gem 'spring-commands-rspec'
  gem 'guard-rspec'
  gem 'cucumber-rails', require: false
end

group :production do
  gem 'pg'
end
