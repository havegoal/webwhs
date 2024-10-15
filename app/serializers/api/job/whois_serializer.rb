
class Api::Job::WhoisSerializer < Panko::Serializer
  attributes :id, :state, :domain, :registered, :free, :registered_at, :expires_at

  def state
    object.state_name
  end
end
