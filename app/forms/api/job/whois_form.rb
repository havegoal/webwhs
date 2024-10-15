class Api::Job::WhoisForm < Api::Job::Whois
  include ActiveFormModel

  permit :domain, webhooks: []

  validates :domain, presence: true

  def domain=(value)
    self.request_domain = value&.strip&.downcase
  end

  def webhooks=(ids)
    return if ids.blank?

    self.request_webhooks = ids.map { |id| account.webhooks.find(id).pluck(:id) }
  end
end
