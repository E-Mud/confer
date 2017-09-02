ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

DatabaseCleaner.strategy = :transaction

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  def default_json_headers
    {
      'CONTENT_TYPE' => 'application/json',
      'ACCEPT' => 'json'
    }
  end

  setup do
    DatabaseCleaner.start
  end

  teardown do
    DatabaseCleaner.clean
  end

  def put_json(path, obj)
    put path, params: obj.to_json, headers: default_json_headers
  end

  def post_json(path, obj)
    post path, params: obj.to_json, headers: default_json_headers
  end

  def get_json(path, obj)
    get path, headers: default_json_headers
  end

  def delete_json(path, obj)
    delete path, headers: default_json_headers
  end

  def json_response
    JSON.parse(response.body)
  end

  def assert_created
    assert_equal "201", response.code
  end
end
