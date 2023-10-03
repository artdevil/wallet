class Balance < ApplicationRecord
  belongs_to :owner, polymorphic: true
  belongs_to :reference, polymorphic: true, optional: true
  
  # Debit adalah pencatatan pengurangan nominal uang sementara kredit adalah pencatatan dimana uang bertambah.
  # https://www.cimbniaga.co.id/id/inspirasi/gayahidup/apa-itu-perbedaan-debit-dan-kredit-ini-penjelasannya

  enum balance_type: {
    credit: 'credit', # money increase
    debit: 'debit' # money decrease
  }
end
