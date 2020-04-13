# frozen_string_literal: true

source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.2'

gem 'bootstrap-sass'
gem 'bootstrap-will_paginate'
gem 'faker'
gem 'sprockets'
gem 'travis'
gem 'will_paginate'

# these gems are for users profile pic
gem 'carrierwave'
gem 'mini_magick'

gem 'coffee-rails'
gem 'database_cleaner'
gem 'email_validator'
gem 'sass-rails'
gem 'uglifier'
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
gem 'active_hash_relation'
gem 'active_model_serializers'
gem 'bcrypt'
gem 'bootsnap', require: false
gem 'jwt'
gem 'pundit'
gem 'responders'
gem 'simple_command'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'byebug'
  gem 'factory_girl_rails'
  gem 'rspec-rails'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  gem 'codecov', require: false
end

group :test do
  gem 'capybara'
  gem 'cucumber-rails', require: false
  gem 'guard-rspec'
  gem 'selenium-webdriver'
  gem 'spring-commands-rspec'
end

group :production do
  gem 'pg'
end
