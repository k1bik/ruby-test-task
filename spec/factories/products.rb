FactoryBot.define do
  factory :product do
    association :user

    weight { FFaker::Book.title }
    length { FFaker::Lorem.sentence }
    width { FFaker::Number.number(digits: 2) }
    height { FFaker::Number.number(digits: 2) }
    departure { FFaker::AddressRU.city }
    destination { FFaker::AddressRU.city }
    distance { FFaker::Number.number(digits: 4) }
    price { FFaker::Number.number(digits: 4) }
  end
end
