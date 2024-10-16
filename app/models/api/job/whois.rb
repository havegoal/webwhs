class Api::Job::Whois < Api::Job
  store :request,   accessors: [ :domain, :webhook_ids ], coder: JSON
  store :response,  accessors: [ :domain, :registered_at, :expires_at, :registered ], coder: JSON, prefix: true
end
