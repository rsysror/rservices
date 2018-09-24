# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :feedback do
    description 'Very good service'
    rating '4'
    # user_id '1'
    # portfolio_id '1'
    # service_request_id '1'
     trait :user do
      user user
    end
     trait :portfolio do
      portfolio portfolio
    end
     trait :service_request do
      service_request service_request
    end
  end
end
