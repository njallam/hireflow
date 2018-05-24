source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'rails', '~> 5.2.0'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
# gem 'jbuilder', '~> 2.5'
# gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem "rubocop", "~> 0.56.0"
  gem "haml_lint", "~> 0.27.0"
  gem "reek", "~> 4.8"
  gem "rails_best_practices", "~> 1.19"
  gem "brakeman", "~> 4.3"
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rails-erd'
end

group :test do
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  gem "database_cleaner", "~> 1.7"
  gem "faker", "~> 1.8"
  gem "factory_bot_rails", "~> 4.8"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem "jquery-rails", "~> 4.3"
gem "bootstrap", "~> 4.1"
gem "haml", "~> 5.0"
gem "haml-rails", "~> 1.0"
gem "devise", "~> 4.4"
gem "simple_form", "~> 4.0"