require "test_helper"

class Api::KeyTest < ActiveSupport::TestCase
  test "the truth" do
    assert Api::Key.last.present?
  end
end
