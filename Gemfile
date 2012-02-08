source 'http://rubygems.org'

gem 'rails', '3.2.1'
gem 'rspec-rails'

gem 'multi_json'
gem 'json', :require => false
gem 'yajl-ruby', :require => false

if RUBY_PLATFORM == "java"
  gem 'activerecord-jdbc-adapter'
  gem 'activerecord-jdbcsqlite3-adapter'
else 
  gem 'sqlite3-ruby'
end