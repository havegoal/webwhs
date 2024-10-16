require "test_helper"

class Api::V1::WhoisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_key = api_keys(:default_api_key)
  end

  test "should require authorization" do
    post api_v1_whois_path, params: { domain: "example.com" }

    assert_response :unauthorized
    assert_kind_of Array, parsed_response["errors"]
  end

  test "should create job" do
    post api_v1_whois_path, params: { domain: " eXaMpLe.Com " }, headers: { Authorization: "Bearer #{@api_key.token}" }

    assert_response :success
    assert_equal "example.com", parsed_response["domain"]
  end

  test "should support webhooks" do
    webhook = webhooks(:default_webhook)
    post api_v1_whois_path, params: { domain: "example.com ", webhook_ids: [ webhook.id ] }, headers: { Authorization: "Bearer #{@api_key.token}" }

    assert_response :success
    assert_equal "example.com", parsed_response["domain"]
  end

  test "should return errors when no domain param" do
    post api_v1_whois_path, headers: { Authorization: "Bearer #{@api_key.token}" }

    assert_response :unprocessable_entity
    assert_kind_of Array, parsed_response["errors"]
  end

  test "show return job" do
    job = api_jobs(:default_whois)
    get api_v1_whoi_path(id: job.id), headers: { Authorization: "Bearer #{@api_key.token}" }

    assert_response :success
  end
end
