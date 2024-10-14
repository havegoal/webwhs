class Api::Key < ApplicationRecord
  belongs_to :account

  encrypts :value, deterministic: true
end
