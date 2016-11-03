source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'rake'
gem 'phut', github: 'trema/phut', branch: 'develop'
gem 'pio', github: 'trema/pio', branch: 'develop'
gem 'trema', github: 'trema/trema', branch: 'develop'

group :development, :test do
  gem 'aruba', require: false
  gem 'codeclimate-test-reporter', require: false
  gem 'coveralls', require: false
  gem 'cucumber', require: false
  gem 'flay', require: false
  gem 'flog', require: false
  gem 'guard', require: false
  gem 'guard-bundler', require: false
  gem 'guard-rspec', require: false
  gem 'guard-rubocop', require: false
  gem 'inch', require: false
  gem 'reek', require: false
  gem 'rspec', require: false
  gem 'rspec-given', require: false
  gem 'rubocop', require: false
  gem 'yard', require: false
end
