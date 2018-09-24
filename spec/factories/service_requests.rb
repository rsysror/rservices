# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :service_request do
    status_id 1
    user     User.first
    service_id  1
    portfolio_id 1
    service_date DateTime.now
    time_slot_id 1
     trait :address do
      address address
     end
  end
end
