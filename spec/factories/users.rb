FactoryBot.define do
  factory :user do
      name {Faker::Name.name_with_middle}
      email {Faker::Internet.email}
      number {Faker::PhoneNumber.cell_phone_with_country_code}
      address {'sasaram'}
      password {'pass@123'}
      
  end
end
