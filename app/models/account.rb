class Account < ApplicationRecord
  has_many :api_keys, class_name: Api::Key.name
  has_many :webhooks
end
