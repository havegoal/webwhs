
class Api::Job::WhoisSerializer < Jserializer::Base
  attributes :id, :state, :domain, :registered, :free, :registered_at, :expires_at
  # attributes :id, :domain

  def domain
    object.domain
  end

  def state
    object.state_name
  end

  def registered
    object.response_registered
  end

  def free
    object.response_free
  end

  def registered_at
    object.response_registered_at
  end

  def expires_at
    object.response_expires_at
  end
end
