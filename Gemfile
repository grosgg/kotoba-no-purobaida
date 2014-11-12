source 'https://rubygems.org'
ruby '2.1.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.7'

gem 'mongoid', '~> 4.0.0'
gem 'devise', '~> 3.3.0'
gem 'slim-rails', '~> 2.1.4'
gem 'foundation-rails', '~> 5.2.2.0'

gem "pdfkit", "~> 0.5.4"
gem "kaminari", "~> 0.15.0"
gem "mongoid_search", "~> 0.3.2"

gem 'angularjs-rails', '~> 1.2.16'
gem 'angularjs-rails-resource', '~> 1.1.1'

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

group :test do
  gem 'rspec-rails'
  gem 'mongoid-rspec', '~> 1.9.0'
  gem 'factory_girl_rails'
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
end

group :development do
  gem 'spring'
  gem 'pry-byebug'
  gem 'capistrano', '~> 3.2.1'
  gem 'capistrano-rbenv'
  gem 'capistrano-rails'
  gem 'capistrano-bundler'
  gem 'capistrano3-unicorn'
end

group :production, :staging do
  gem 'unicorn'
  gem 'execjs'
end