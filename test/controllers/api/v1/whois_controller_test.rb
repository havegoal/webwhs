require "test_helper"

class Api::V1::WhoisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_key = api_keys(:default)
  end

  test "should create" do
    post api_v1_whois_path, params: { domain: "0512.ru" }, headers: { Authorization: "Bearer #{@api_key.token}" }

    assert_response :success
  end
end
