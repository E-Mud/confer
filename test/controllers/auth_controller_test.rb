require 'test_helper'

class AuthControllerTest < ActionDispatch::IntegrationTest
  self.use_transactional_tests = true
  self.use_instantiated_fixtures = true
  fixtures :accounts, :users

  test "should generate token" do
    user = users(:one)
    account = accounts(:default_account)
    expected = {'id' => user.id, 'username' => user.username, 'accountId' => account.id}
    post_json '/auth/login', {username: 'test@test.com', password: 'password'}

    assert json_response['token']
    assert_equal expected, json_response['user']
  end

end
