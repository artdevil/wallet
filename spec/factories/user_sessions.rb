FactoryBot.define do
  factory :user_session do
    user { nil }
    token { "MyString" }
    expired_at { "2023-10-03 08:43:51" }
  end
end
