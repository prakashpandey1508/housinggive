FactoryBot.define do
  factory :property do
    name {Faker::Name.name}
    descripition {"ckjnejnfwuiebfwiubfw"}
    price { Faker::Commerce.price }
    address {"sasaram"}
  end
end
