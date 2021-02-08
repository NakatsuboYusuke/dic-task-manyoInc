source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
# Ruby
ruby '2.6.5'

# Core
gem 'rails', '~> 5.2.3'

# Middleware
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'

# View/Frontend
gem 'sass-rails', '~> 5.0'
gem 'autoprefixer-rails'
gem 'jquery-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'slim-rails'
gem 'html2slim'
gem 'font-awesome-rails'
gem 'ransack'
gem 'enum_help'
gem 'kaminari'
gem 'bootstrap'

# Debug
gem 'pry-rails'
gem 'better_errors'
gem 'binding_of_caller'
gem 'faker'

# Backend
gem 'jbuilder', '~> 2.5'
# delete turbolinks for javascript
gem 'turbolinks', '~> 5'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'rails-i18n'
gem 'bcrypt', '3.1.11'
gem 'carrierwave', '~> 2.1'
#gem 'mini_magick'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # RSpec
  gem 'factory_bot_rails'
  gem 'spring-commands-rspec'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'letter_opener_web'
  # Security
  gem 'dotenv-rails'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  # RSpec
  gem 'rspec-rails'
  gem 'database_cleaner'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
