class Deposit < ApplicationRecord
  belongs_to :owner, polymorphic: true

  validates :amount, numericality: { greater_than: 0 }, presence: true

  after_create :set_owner_balance

  private

  def set_owner_balance
    Balance.credit.create(
      owner: owner,
      reference: self,
      amount: amount
    )
  end
end
