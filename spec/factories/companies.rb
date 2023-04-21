FactoryBot.define do
  factory :company do
    name {Faker::Name.name_with_middle}
    email {Faker::Internet.email}
    number {Faker::PhoneNumber.cell_phone_with_country_code}
  end
end
