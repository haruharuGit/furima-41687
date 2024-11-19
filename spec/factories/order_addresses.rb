FactoryBot.define do
  factory :order_address do
    postal_code           { '123-4567' }
    prefecture_id         { Faker::Number.between(from: 2, to: 48) }
    city                  { Faker::Address.city }
    house_number          { Faker::Address.street_address }
    building_name         { Faker::Address.building_number }
    phone_number          { '09012345678' }
  end
end
