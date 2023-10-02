require 'active_support/concern'

module HasTransactions
  extend ActiveSupport::Concern

  included do
    has_many :deposits, as: :owner
    has_many :withdraws, as: :owner
    has_many :balances, as: :owner
    has_many :source_transfers, as: :source, class_name: 'Transfer'
    has_many :target_transfers, as: :target, class_name: 'Transfer'
  end

  def current_balance
    credit_amounts = balances.credit.sum(:amount)
    debit_amounts = balances.debit.sum(:amount)

    credit_amounts - debit_amounts
  end
end