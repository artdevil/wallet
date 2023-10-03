class Team < ApplicationRecord
  include HasTransactions
  
  has_and_belongs_to_many :users
end
