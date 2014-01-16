source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

# Use postgresql as the database for Active Record
gem 'pg'

# Use Haml for templating 
gem 'haml'

# Use Simple_form for form formating
gem 'simple_form'

# Use Pg_search to query multiple tables and return filtered results
gem 'pg_search'

# Used to get coordinates and query current weather
gem 'geocoder'
gem 'forecast_io'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

gem 'faker', '1.1.2'
gem 'hirb'
gem 'foundation-rails'

group :development, :test do
  gem 'rspec-rails'
  # The following optional lines are part of the advanced setup.
  gem 'guard-rspec', '2.5.0'
  gem 'spork-rails', '4.0.0'
  gem 'guard-spork', '1.5.0'
  gem 'childprocess', '0.3.6'
  gem 'better_errors', '1.1.0'
  gem 'binding_of_caller', '0.7.2'
end

group :test do
  gem 'selenium-webdriver', '2.35.1'
  gem 'capybara', '2.1.0'
  gem 'factory_girl_rails'
  gem 'cucumber-rails', '1.4.0', :require => false
  gem 'database_cleaner'
  gem 'launchy'
end

group :production do
  gem 'rails_12factor'
end