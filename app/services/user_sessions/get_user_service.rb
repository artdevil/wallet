class UserSessions::GetUserService < ApplicationService
  attr_reader :token

  def initialize(token)
    @token = token
  end

  def call
    token_base64 = Base64.decode64(token)
    token_decrypt = Protected.decrypt(token_base64)
    
    UserSession.get_user(token_decrypt)
  end
end