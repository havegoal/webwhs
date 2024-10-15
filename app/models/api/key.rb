class Api::Key < ApplicationRecord
  belongs_to :account
  has_many :api_jobs, class_name: Api::Job.name

  encrypts :token, deterministic: true
end
