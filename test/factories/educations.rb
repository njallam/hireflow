FactoryBot.define do
  factory :education do
    place { Faker::Educator.university }
    start_date { Faker::Date.between 10.years.ago, Time.zone.today }
    end_date { Faker::Date.between start_date, Time.zone.today }
    applicant
  end
end
