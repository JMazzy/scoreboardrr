source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.2.0'
gem 'sqlite3', '~> 1.3.13'
gem 'puma', '~> 3.11.4'
gem 'sass-rails', '~> 5.0.7'
gem 'uglifier', '~> 4.1.11'
gem 'semantic-ui-sass', '~> 2.3.1.2'
gem 'jquery-rails', '~> 4.3.3'

group :development, :test do
  gem 'pry-byebug', '~> 3.6.0'
  gem 'rspec-rails', '~> 3.7.2'
  gem "better_errors", '~> 2.4.0'
  gem "binding_of_caller", '~> 0.8.0'
end

group :development do
  gem 'web-console'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
