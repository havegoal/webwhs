class WhoisJob < ApplicationJob
  TIMEOUT = 20.freeze
  queue_as :whois_queue

  def perform(job_id)
    job = Api::Job::Whois.find(job_id)
    job.make_it_processing!

    whois = Whois::Client.new(timeout: TIMEOUT)
    record = whois.lookup(job.domain)
    parser = record.parser

    job.response_domain         = parser.domain
    job.response_registered     = parser.registered?
    job.response_registered_at  = parser.created_on
    job.response_expires_at     = parser.expires_on

    job.make_it_ready!
  end
end
