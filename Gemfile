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
gem 'bootsnap', '>= 1.1.0', require: false

# Deployment
group :development do
  gem 'capistrano', '~> 3.10'
  gem 'capistrano-rails', '~> 1.3'
  gem 'capistrano-rbenv', '~> 2.1'
  gem 'capistrano3-puma', '~> 3.1'
end

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry', '~> 0.11.3'
  gem 'factory_bot_rails', '~> 4.8'
  gem 'rubocop', '~> 0.56.0'
  gem 'haml_lint', '~> 0.27.0'
  gem 'reek', '~> 4.8'
  gem 'rails_best_practices', '~> 1.19'
  gem 'brakeman', '~> 4.3'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rails-erd'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :test do
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  gem 'database_cleaner', '~> 1.7'
  gem 'faker', '~> 1.8'
  gem 'simplecov', '~> 0.16.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'jquery-rails', '~> 4.3'
gem 'bootstrap', '~> 4.1'
gem 'haml', '~> 5.0'
gem 'haml-rails', '~> 1.0'
gem 'devise', '~> 4.7'
gem 'simple_form', '~> 4.0'
gem 'aasm', '~> 4.12'
gem 'font-awesome-sass', '~> 5.0'
gem 'validates_timeliness', '~> 4.0'
gem 'smart_listing', '~> 1.2'
