class Api::SessionsController < ApplicationController
  def create
    user = User.find_by_email(session_params[:email])

    if user && user.authenticate(session_params[:password])
      session = UserSessions::GenerateTokenService.call(user)

      respond_success(session)
    else
      respond_form_with_error({ message: 'invalid email or password' }, session_params)
    end
  end

  private

  def session_params
    params.permit(:email, :password)
  end
end