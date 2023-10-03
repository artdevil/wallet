FactoryBot.define do
  factory :balance do
    owner { create(:user) }
    amount { Faker::Number.decimal }
  end

  factory :balance_credit, parent: :balance do
    balance_type { 'credit' }
  end
end
