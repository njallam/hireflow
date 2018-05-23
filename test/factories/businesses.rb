FactoryBot.define do
  factory :business do
    name { Faker::SiliconValley.company }
    bio { Faker::Lorem.paragraphs }
  end
end
