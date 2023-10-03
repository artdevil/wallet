require 'digest/md5'

class User < ApplicationRecord
  include HasTransactions

  has_and_belongs_to_many :teams

  attr_accessor :password

  validates :password, length: { minimum: 6 }, presence: true, on: :create

  def authenticate(password)
    return false if password.blank?

    return self if encrypted_password == Digest::MD5.hexdigest(password)
  end

  before_create :set_encrypted_password

  private

  def set_encrypted_password
    self.encrypted_password = Digest::MD5.hexdigest(password)
  end
end
