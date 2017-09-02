require 'test_helper'

class AccountControllerTest < ActionDispatch::IntegrationTest
  test "creates one account" do
    post_json '/signup', {username: 'test@test.com', password: 'password'}

    created_accounts = Account.all

    assert_equal 1, created_accounts.length
  end

  test "creates one user" do
    post_json '/signup', {username: 'test@test.com', password: 'password'}

    created_users = User.all

    assert_equal 1, created_users.length

    created_user = created_users.first
    assert_equal 'test@test.com', created_user.username
    assert_equal 'password', created_user.password
  end

  test "links created user and account" do
    post_json '/signup', {username: 'test@test.com', password: 'password'}

    created_user = User.first
    created_account = Account.first

    assert_equal created_account, created_user.account
  end

  test "outputs created user" do
    post_json '/signup', {username: 'test@test.com', password: 'password'}

    created_account = Account.first
    created_user = User.first
    expected = {'id' => created_user.id, 'username' => 'test@test.com', 'accountId' => created_account.id}

    assert_created
    assert_equal expected, json_response
  end
end
