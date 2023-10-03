class UserSessions::GetUserService < ApplicationService
  attr_reader :token

  def initialize(token)
    @token = token
  end

  def call
    return if token.blank?
    
    token_base64 = Base64.decode64(token)
    token_decrypt = Protected.decrypt(token_base64)
    
    UserSession.get_user(token_decrypt)
  rescue OpenSSL::Cipher::CipherError
    nil
  end
end