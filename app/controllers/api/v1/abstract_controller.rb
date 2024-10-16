class Api::V1::AbstractController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :authenticate

  private

  def authenticate
    @api_key = authenticate_with_http_token { |token, _options| Api::Key.find_by(token:) }

    render(json: { errors: [ "Unauthorized" ], result: false }, status: :unauthorized) if @api_key.nil?
  end

  def current_account
    current_api_key.account
  end

  def current_api_key
    @api_key
  end
end
