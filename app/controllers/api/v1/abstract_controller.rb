class Api::V1::AbstractController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :authenticate

  private

  def authenticate
    if api_key = authenticate_with_http_token { |token, _options| Api::Key.find_by(token:) }
      @current_account = api_key.account
    else
      render json: { error: "Unauthorized", result: false }, status: :unauthorized
    end
  end
end
