# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :service_request do
    service_date DateTime.now
    trait :user do
      user user
    end
    trait :portfolio do
      portfolio portfolio
    end
    trait :address do
      address address
    end
    trait :status do
      status status
    end
    trait :service do
      service service
    end
    trait :time_slot do
      time_slot time_slot
    end
  end
end
