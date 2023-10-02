class Balance < ApplicationRecord
  belongs_to :owner, polymorphic: true
  belongs_to :reference, polymorphic: true
  
  enum balance_type: {
    debit: 'debit',
    credit: 'credit'
  }
end
