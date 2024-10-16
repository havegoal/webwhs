class Api::Job < ApplicationRecord
  belongs_to :api_key, class_name: Api::Key.name

  delegate :account, to: :api_key

  # enum :kind, whois: 1

  # serialize :request,   type: Hash
  # serialize :response,  type: Hash

  state_machine :state, initial: :queue do
    state :queue,       value: 0
    state :processing,  value: 1
    state :failed,      value: 127
    state :ready,       value: 255

    event :make_it_processing do
      transition queue: :processing
    end

    event :make_it_failed do
      transition processing: :failed
    end

    event :make_it_ready do
      transition processing: :ready
    end
  end
end
