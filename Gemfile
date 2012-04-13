source 'https://rubygems.org'

gem 'rails', '3.2.1'
gem 'heroku', '~> 2.21.3'
gem "devise", "~> 2.0.4"


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :development, :test do
  gem 'mysql2'
  gem "rspec-rails", "~> 2.9.0"
  gem "capybara", "~> 1.1.2"
  gem "launchy", "~> 2.1.0"
end

group :production do
  gem 'pg', '0.12.2'
end