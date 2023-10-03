FactoryBot.define do
  factory :transfer do
    source { create(:user) }
    target { create(:team) }
    amount { Faker::Number.decimal }
  end
end
