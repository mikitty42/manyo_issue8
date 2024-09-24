source "https://rubygems.org"

ruby "3.1.6"

gem "rails", "~> 7.1.3", ">= 7.1.3.4"

gem "sprockets-rails"

gem "pg", "~> 1.1"


gem "puma", ">= 5.0"

gem "importmap-rails"

gem "turbo-rails"

gem "stimulus-rails"

gem "jbuilder"


gem "tzinfo-data", platforms: %i[ windows jruby ]

gem "bootsnap", require: false


group :development, :test do

  gem "debug", platforms: %i[ mri windows ]
  gem 'rspec-rails', '~> 6.0'
  gem 'factory_bot_rails'
  gem 'rexml'
end

group :development do

  gem "web-console"

  gem "error_highlight", ">= 0.4.0", platforms: [:ruby]
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'webdrivers'
end
