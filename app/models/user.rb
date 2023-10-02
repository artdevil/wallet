require 'digest/md5'

class User < ApplicationRecord
  include HasTransactions

  has_and_belongs_to_many :teams

  attr_accessor :password

  validates :password, length: { minimum: 6 }, on: :create
  before_validation :set_encrypted_password, on: :create 

  private

  def set_encrypted_password
    self.encrypted_password = Digest::MD5.hexdigest(password)
  end
end
