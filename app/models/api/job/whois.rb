class Api::Job::Whois < Api::Job
  store :response, accessors: [ :domain, :registered_at, :expires_at, :registered, :free ], coder: JSON, prefix: true

  def domain
    request_domain
  end

  def registered
    response_registered
  end

  def free
    response_free
  end

  # created_on
  def registered_at
    response_registered_at
  end

  # expires_on
  def expires_at
    response_expires_at
  end
end
