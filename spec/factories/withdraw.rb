FactoryBot.define do
  factory :withdraw do
    owner { create(:user) }
    amount { Faker::Number.decimal }
  end
end
