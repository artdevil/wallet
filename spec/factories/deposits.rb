FactoryBot.define do
  factory :deposit do
    owner { create(:user) }
    amount { Faker::Number.decimal }
  end
end
