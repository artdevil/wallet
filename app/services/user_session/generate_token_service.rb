class UserSession::GenerateTokenService < ApplicationService
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def call
    new_session = UserSession.create(user: user)

    token_encrypt = Protected.encrypt(new_session.token)
    token_base64 = Base64.encode64(token_encrypt)

    {
      session_token: token_base64,
      expired_at: new_session.expired_at
    }
  end
end