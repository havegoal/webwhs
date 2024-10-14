require "test_helper"

class AccountTest < ActiveSupport::TestCase
  test "the truth" do
    assert Account.last.present?
  end
end
