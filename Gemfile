ruby '3.4.1'

source "https://rubygems.org"

gem "rails", "~> 8.0.1"

# Use sqlite3 in development and test
group :development, :test do
  gem "sqlite3", ">= 2.1"
end

# Use PostgreSQL in production (Heroku)
group :production do
  gem "pg", "~> 1.2"
end

# Use the Puma web server
gem "puma", ">= 5.0"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS)
gem "rack-cors"

gem 'devise', '~> 4.9', '>= 4.9.4'
gem 'devise_token_auth', '~> 1.2', '>= 1.2.5'

# Use the database-backed adapters for Rails.cache, Active Job, and Action Cable
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Add HTTP asset caching/compression and X-Sendfile acceleration to Puma
gem "thruster", require: false

group :development, :test do
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end
