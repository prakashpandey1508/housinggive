FactoryBot.define do
  factory :propertytype do
    name {Faker::Name.name_with_middle}

  end
end
