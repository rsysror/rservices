# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name 'Test'
    last_name 'User'
    phone '92929292'
    email 'test@example.com'
    password 'password'
    password_confirmation 'password'
  end
end
