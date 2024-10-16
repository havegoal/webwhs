class ActionDispatch::IntegrationTest
  def parsed_response
    @parsed_response ||= JSON.parse(response.body)
  end
end
