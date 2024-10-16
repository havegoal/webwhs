class Webhook < ApplicationRecord
  belongs_to :account

  # NOTE: Only post method supports now
  enum :request_method, post: "post"

  encrypts :url
end
