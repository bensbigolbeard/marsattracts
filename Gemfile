source 'https://rubygems.org'
ruby '2.0.0'

gem 'figaro' # Store mailer credentials
gem 'forecast_io' # Query current weather
gem 'foundation-rails' # Front-end framework
gem 'geocoder' # Get coordinates for weather API
gem 'haml' # HTML templating 
gem 'jquery-rails' # DOM JavaScript library
gem 'mandrill-api' # Mailer
gem 'nokogiri' # Parsing Wolfram API
gem 'pg' # Database for Active Record
gem 'pg_search' # Query multiple tables and return filtered results
gem 'rails', '4.0.2' # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'sass-rails' # For stylesheets
gem 'simple_form' # Form formating
gem 'uglifier' # Compressor for JavaScript assets
gem 'unirest' # For MAAS Mars weather API

group :production do
  gem 'rails_12factor' # Add 12 factors best practices to Rails
end

group :test do
  gem 'rspec-rails' # R-spec for testing
  #gem 'factory_girl_rails' # Creates custom data records
  #gem 'database_cleaner' # Cleans database
  #gem 'faker' # Creates fake data
  #gem 'vcr' # Pulls in API data to file so calls don't have to be made for each test
end

group :development, :test do
  gem 'pry-plus' # Pry-plus for debugging
  gem 'pry-rails'
  # awesomeprint?
end

group :development do
  gem 'awesome_print' # Print ActiveRecord prettified
  gem 'better_errors' # Creates more descriptive and easier to read errors
  gem 'binding_of_caller' # Creates live shell inside better errors
end