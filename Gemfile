source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "rails", "~> 5.0.2"
gem "dotenv-rails", require: "dotenv/rails-now"
gem "pg"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "jquery-rails"
gem "devise"
gem "omniauth-facebook"
gem "paper_trail"
gem "actionpack-page_caching"
gem "turbolinks", "~> 5.0.0"

group :development, :test do
  gem "byebug", platform: :mri
  gem "factory_girl"
  gem "factory_girl_rails"
  gem "faker"
  gem "pry-rails"
  gem "puma", "~> 3.0"
  gem "rspec-core"
  gem "rspec-expectations"
  gem "rspec-mocks"
  gem "rspec-rails"
  gem "rspec-support"
  gem "shoulda-matchers", "~> 3.1"
  gem "database_cleaner"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", "~> 3.0.5"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "rubocop", require: false
end

group :production do
  gem "unicorn"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
