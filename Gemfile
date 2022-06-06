source "https://rubygems.org"
git_source(:github){|repo| "https://github.com/#{repo}.git"}

ruby "3.1.2"

gem "bcrypt", "~> 3.1", ">= 3.1.18"
gem "bootsnap", require: false
gem "bootstrap-sass", "~> 3.4", ">= 3.4.1"
gem "bootstrap-will_paginate", "1.0.0"
gem "config", "~> 4.0"
gem "faker", "2.1.2"
gem "figaro", "~> 1.2"
gem "importmap-rails"
gem "jbuilder"
gem "mysql2", "~> 0.5.4"
gem "puma", "~> 5.0"
gem "rails", "~> 7.0.3"
gem "rails-i18n"
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i(mingw mswin x64_mingw jruby)
gem "webpacker"
gem "pagy", "~> 5.10", ">= 5.10.1"

group :development, :test do
  # gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "pry", "~> 0.14.1"
  gem "rubocop", "~> 1.26", require: false
  gem "rubocop-checkstyle_formatter", require: false
  gem "rubocop-rails", "~> 2.14.0", require: false
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
