FactoryBot.define do
  factory :product do
    sku { 'test123' }
    price { 12 }
    quantity { 1 }
    association :user
    association :product_type
  end
end