class Api::Key < ApplicationRecord
  encrypts :value, deterministic: true
end
