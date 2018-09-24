# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    flat_number "101"
    street_name "gaur city"
    landmark "Kishan Chowk"
    pin_code '1212121'
    city_id    1
    user_id   1
  end
end
