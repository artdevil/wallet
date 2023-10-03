class UserSession < ApplicationRecord
  belongs_to :user

  before_create :set_token
  before_create :set_expired_at

  def self.get_user(token)
    where(token: token).where('user_sessions.expired_at > NOW()').take&.user
  end

  private

  def set_expired_at
    self.expired_at = DateTime.current + 7.days
  end

  def set_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless UserSession.exists?(token: random_token)
    end
  end
end
