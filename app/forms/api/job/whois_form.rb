class Api::Job::WhoisForm < Api::Job::Whois
  include ActiveFormModel

  permit :domain, webhook_ids: []

  validates :domain, presence: true

  def domain=(value)
    super(value&.strip&.downcase)
  end

  def webhook_ids=(ids)
    return if ids.blank?

    ids = ids.map { |id| account.webhooks.select(:id).find(id).id }
    super(ids)
  end
end
