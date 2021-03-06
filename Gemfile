source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.1'
# Use sqlite3 as the database for Active Record
group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :development do
  gem 'sqlite3'
  #gem 'jazz_fingers' # One of its dependencies is failing. I can just install the gems individually
  gem 'pry', '~> 0.10.1'
  gem 'pry-coolline', '~> 0.2.5'
  gem 'pry-doc', '~> 0.6.0'
  gem 'pry-git', '~> 0.2.3'
  gem 'pry-rails', '~> 0.3.3'
  gem 'pry-remote', '~> 0.1.8'
  gem 'binding_of_caller'
  gem 'better_errors'
  gem 'meta_request'
end

group :test do
  gem 'rspec-rails', '~> 3.1.0'
  gem 'capybara'
  gem 'database_cleaner' # For emptying the database between tests
  gem 'factory_girl_rails', '~> 4.0'
end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use twitter bootstrap for easy styling
gem 'bootstrap-sass', '~> 3.2.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# faker for generating seed data
gem 'faker'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# Devise for authentication
gem 'devise'

# Figaro for storing credentials as environmental variables
gem 'figaro', '~> 1.0.0.rc1'

# Makes it easier to authorize different users for different tasks
gem 'pundit'

# For markdown parsing
gem 'redcarpet'

# File uploads for rails
gem 'carrierwave'

# For images
gem 'mini_magick'

# For working with Amazon S3
gem 'fog'

# For pagination
gem 'will_paginate', '~> 3.0.5'

# Have your tests run in the background whenever files are changed
gem 'guard-rspec', require: false

