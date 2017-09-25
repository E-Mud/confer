require 'test_helper'

class AppsControllerTest < ActionDispatch::IntegrationTest
  test "creates a new app" do
    post_json '/apps', {name: 'MyApp'}
    assert_response :success
  end
end
