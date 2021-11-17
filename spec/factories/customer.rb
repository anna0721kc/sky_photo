FactoryBot.define do
  factory :customer do
    email { "test@gmail.com" }
    name { "test1" }
    password {"111111"}
    password_confirmation {"111111"}
  end
end