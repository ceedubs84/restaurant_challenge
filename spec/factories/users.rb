FactoryGirl.define do
  factory :user do
    name 'Joe Test'
    sequence(:email) { |n| "testuser#{n}@test.com" }
    password 'password'
    admin 'false'
  end
end
