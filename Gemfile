source 'https://rubygems.org'
ruby '2.1.2'

########
# Core #
########

gem 'rails',    '4.1.8'
gem 'rake',     '~> 10.1.1'
gem 'json',     '~> 1.7.7'
gem 'dotenv-rails'
gem 'nokogiri', '~> 1.5.11'
gem 'omniauth-github', '~> 1.0.1'

########
# Data #
########

gem 'pg'
gem 'acts-as-taggable-on'
gem 'carrierwave'
gem 'fog'

################
# Presentation #
################

gem 'haml'
gem 'redcarpet', '2.1'
gem 'will_paginate'
gem 'cocoon'
gem 'md_preview'
gem 'md_emoji'
gem 'draper'

##########
# Assets #
##########

gem 'sass-rails'
gem 'coffee-rails'
gem 'uglifier'
gem 'jquery-rails'
gem 'bourbon'
gem 'neat'
gem 'refills', git: 'git@github.com:thoughtbot/refills.git'

###############
# Maintenance #
###############

group :development do
  gem 'rainbow', :require => false
  gem 'ffaker', :require => false
end

group :test, :development do
  gem 'minitest-rails', '~> 2.1.0'
  gem 'minitest-rails-capybara', '~> 2.1.1'
  gem 'pry-rails'
end

group :test do
  gem 'factory_girl_rails'
  gem 'database_cleaner'
end

group :production do
  gem 'exception_notification'
  gem 'rails_12factor'
end
