class ApplicationController < ActionController::API
  attr_reader :current_user

  def respond_form_with_error(errors, params = {})
    data = {}
    data[:success] = false
    data[:params] = params if params.present?
    data[:errors] = errors if errors.present?

    render json: data, status: :unprocessable_entity
  end

  def respond_success(data)
    params = {}
    params[:success] = true
    params[:data] = data if data.present?

    render json: params, status: :ok
  end

  def user_not_authorized
    data = {}
    data[:success] = false
    data[:error] = 'You are not authorized to perform this action'
    render json: data, status: :unauthorized
  end

  def handle_bad_authentication
    render json: { message: "Bad credentials" }, status: :unauthorized
  end
  
  def authenticate_user!
    authenticate_user_with_token || handle_bad_authentication
  end

  def authenticate_user_with_token
    @current_user = UserSessions::GetUserService.call(bearer_token)
  end

  private

  def bearer_token
    request.headers['Authorization'].to_s.split(' ').last
  end
end
