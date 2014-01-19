source 'https://rubygems.org'
ruby '2.0.0'

gem 'coffee-rails' # Activates Coffeescript for Rails
gem 'figaro' # Figaro for storing mailer credentials
gem 'forecast_io' # Use to query current weather
gem 'foundation-rails'
gem 'geocoder' # Use to get coordinates for weather API
gem 'haml' # Use Haml for templating 
gem 'jquery-rails' # Use jquery as the JavaScript library
gem 'mandrill-api' # Mandrill for mailer
gem 'nokogiri' # Nokogiri for Wolfram API
gem 'pg' # Use postgresql as the database for Active Record
gem 'pg_search' # Use Pg_search to query multiple tables and return filtered results
gem 'rails', '4.0.2' # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'sass-rails' # Use SCSS for stylesheets
gem 'simple_form' # Use Simple_form for form formating
gem 'uglifier' # Use Uglifier as compressor for JavaScript assets

group :production do
  gem 'rails_12factor' # Add 12 factors best practices to Rails
end

group :test do
    gem 'rspec-rails' # R-spec for testing
    gem 'capybara' # Testing views and user interaction
    gem 'factory_girl_rails' # Creates custom data records
    gem 'database_cleaner' # Cleans database
    gem 'faker' # Creates fake data
    gem 'vcr' # Pulls in API data to file so calls don't have to be made for each test
  end

group :development, :test do
  gem 'pry-plus' # Pry-plus for debugging
  gem 'pry-rails'
  # awesomeprint?
end

group :development do
  gem 'better_errors' # Creates more descriptive and easier to read errors
  gem 'binding_of_caller' # Creates live shell inside better errors
end