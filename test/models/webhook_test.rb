require "test_helper"

class WebhookTest < ActiveSupport::TestCase
  test "the truth" do
    assert Webhook.last.present?
  end
end
