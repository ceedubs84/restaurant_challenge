FactoryGirl.define do
  factory :user do
    name 'Joe Test'
    sequence(:email) { |n| "testuser#{n}@test.com" }
    password 'password'
    password_confirmation 'password'
    admin 'false'

    factory :admin do
      name 'Test Admin'
      admin 'true'
    end
  end
end
