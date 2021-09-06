FactoryBot.define do
  factory :user_profile do
    name { 'test' }
    association :user
    association :state
  end
end