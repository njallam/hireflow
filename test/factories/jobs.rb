FactoryBot.define do
  factory :job do
    position { Faker::Job.title }
    description { Faker::Lorem.paragraphs }
    business
  end
end
