FactoryBot.define do
  factory :experience do
    place { Faker::Company.name }
    title { Faker::Job.title }
    description { Faker::Lorem.paragraph }
    start_date { Faker::Date.between 10.years.ago, Time.zone.today }
    end_date { Faker::Date.between start_date, Time.zone.today }
    applicant
  end
end
