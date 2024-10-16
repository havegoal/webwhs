class Api::Key < ApplicationRecord
  belongs_to :account
  has_many :api_jobs_whois, class_name: Api::Job::Whois.name, foreign_key: :api_key_id

  encrypts :token, deterministic: true
end
