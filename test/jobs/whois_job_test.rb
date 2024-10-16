require "test_helper"

class WhoisJobTest < ActiveJob::TestCase
  test "job fills data" do
    mock_record = mock("Whois::Record")
    mock_parser = mock("Whois::Parser")
    mock_record.stubs(:parser).returns(mock_parser)

    mock_parser.stubs(:domain).returns("example.com")
    mock_parser.stubs(:registered?).returns(true)
    mock_parser.stubs(:created_on).returns(Time.parse("1703-05-16"))
    mock_parser.stubs(:expires_on).returns(Time.parse("2103-05-16"))

    Whois::Client.any_instance.stubs(:lookup).with("example.com").returns(mock_record)

    job = api_jobs(:default_whois)

    perform_enqueued_jobs do
      WhoisJob.perform_later(job.id)
    end

    job.reload

    assert_equal "example.com", job.response_domain
    assert_equal true, job.response_registered
    assert_equal Time.parse("1703-05-16"), job.response_registered_at
    assert_equal Time.parse("2103-05-16"), job.response_expires_at
  end
end
