FactoryBot.define do
  factory :user do
    firstName { FFaker::Name.name }
    lastName { FFaker::Internet.name }
    patronymic { FFaker::Internet.name }
    phone { FFaker::Number.number(digits: 10) }
    email { FFaker::Internet.email }
  end
end
