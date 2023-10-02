class Withdraw < ApplicationRecord
  belongs_to :owner, polymorphic: true
end
