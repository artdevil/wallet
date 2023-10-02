class Deposit < ApplicationRecord
  belongs_to :owner, polymorphic: true

  validates :amount, numericality: { greater_than: 0 }, presence: true

  after_create :set_balance

  private

  def set_balance
    Balance.create(
      owner: owner,
      reference: self,
      amount: amount,
      balance_type: 'debit'
    )
  end
end
