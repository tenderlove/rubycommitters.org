ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'

Dir[Rails.root.join('spec/support/**/*.rb')].each do |file|
  require file
end

RSpec.configure do |config|
  config.mock_with :mocha
  config.use_transactional_fixtures = true
end
