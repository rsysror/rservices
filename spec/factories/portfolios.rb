FactoryGirl.define do
  factory :portfolio do
    about 'This is Test'
    experience '5'
    status '0'
    address 'Test Test'
    company_name 'R Test'
    company_ph_no '123456789'
    trait :user do
      user user
    end
  end
end