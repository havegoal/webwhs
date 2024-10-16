
class Api::Job::WhoisSerializer < Jserializer::Base
  attributes :id, :state, :domain, :registered, :free, :registered_at, :expires_at

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
    !registered
  end

  def registered_at
    object.response_registered_at
  end

  def expires_at
    object.response_expires_at
  end
end
