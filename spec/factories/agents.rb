FactoryBot.define do
  factory :agent do
    name {Faker::Name.name}
    email {Faker::Internet.email}
    number {Faker::PhoneNumber.cell_phone_with_country_code}
    address {'sasaram'}
    password {'Pass@123'}
  end
end
