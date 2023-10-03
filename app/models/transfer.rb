class Transfer < ApplicationRecord
  belongs_to :source, polymorphic: true
  belongs_to :target, polymorphic: true

  validates :amount, numericality: { greater_than: 0 }, presence: true
  validate :check_source_balance

  after_create :set_source_debit_balance
  after_create :set_target_credit_balance

  private

  def check_source_balance
    if source.current_balance < (amount || 0)
      errors.add(:base, 'source balance not sufficient')
    end
  end

  def set_source_debit_balance
    Balance.debit.create(
      owner: source,
      reference: self,
      amount: amount
    )
  end

  def set_target_credit_balance
    Balance.credit.create(
      owner: target,
      reference: self,
      amount: amount
    )
  end
end
