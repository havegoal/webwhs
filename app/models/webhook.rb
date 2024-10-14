class Webhook < ApplicationRecord
  belongs_to :account

  # NOTE: Only post method supports now
  enum :request_method, post: 30

  encrypts :url
end
