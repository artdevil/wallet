require 'digest/md5'

class User < ApplicationRecord
  include HasTransactions

  has_secure_password

  has_and_belongs_to_many :teams

  # validates :password, length: { minimum: 6 }, presence: true, on: :create
end
