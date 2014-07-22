FactoryGirl.define do
  factory :manufacturer do
    sequence(:name) { |n| "Jeep #{n}" }
    country 'USA'
  end
end
