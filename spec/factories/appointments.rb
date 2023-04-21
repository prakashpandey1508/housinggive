FactoryBot.define do
  factory :appointment do
    date { Date.today + rand(1..30) }
  end
end
