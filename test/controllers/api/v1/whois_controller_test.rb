require "test_helper"

class Api::V1::WhoisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_key = api_keys(:default)
  end

  test "should get create" do
    get api_v1_whois_path, headers: { Authorization: "Bearer #{@api_key.token}" }

    assert_response :success
  end
end
