ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

DatabaseCleaner.strategy = :transaction

class ActiveSupport::TestCase
  DatabaseCleaner.clean_with(:truncation)
end

class ActionDispatch::IntegrationTest
  def default_json_headers
    {
      'CONTENT_TYPE' => 'application/json',
      'ACCEPT' => 'json',
      'HTTP_AUTHORIZATION' => 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjp7ImlkIjoxNDA3MDEwMTAsInVzZXJuYW1lIjoidGVzdEB0ZXN0LmNvbSIsImFjY291bnRJZCI6MjYzMzkxMjAzfX0.slGeD3rKtzy6acvFeX4PG8Av3VBbONZCxRJ2F8Ti1VY'
    }
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
    assert_response :created
  end
end
