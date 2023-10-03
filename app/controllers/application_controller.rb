class ApplicationController < ActionController::API
  def current_resource_owner
    User.find_by_id(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end

  def current_user
    current_resource_owner
  end

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
end
