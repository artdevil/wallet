class Withdraw < ApplicationRecord
  belongs_to :owner, polymorphic: true

  validates :amount, numericality: { greater_than: 0 }, presence: true
  validate :check_owner_balance

  # before_create :check_owner_balance
  after_create :set_owner_balance

  private

  def check_owner_balance
    if owner.current_balance < (amount || 0)
      errors.add(:base, 'owner balance not sufficient')
    end
  end

  def set_owner_balance
    Balance.debit.create(
      owner: owner,
      reference: self,
      amount: amount
    )
  end
end
