if ENV['COVERAGE'] == 'true'
  require "simplecov"
  SimpleCov.start "rails"
end
 
ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require "minitest/autorun"
require "minitest/reporters"
require 'capybara/rails'

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(:color => true)]

class ActiveSupport::TestCase
  include Devise::TestHelpers
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionController::TestCase
  include Devise::TestHelpers
  
  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL

  # Add more helper methods to be used by all tests here...
  def setup
    Capybara.current_driver = Capybara.javascript_driver # :selenium by default
    # Capybara.current_driver = :webkit
  end

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
    Timecop.return
  end
  
end
