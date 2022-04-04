FactoryBot.define do
  factory :group do
    name { Faker::Movies::StarWars.quote }
  end
end
