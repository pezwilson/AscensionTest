include ActionDispatch::TestProcess

FactoryGirl.define do

  factory :user do
    sequence(:first_name) { |n| "John #{n}" }
    sequence(:last_name) { |n| "Doe#{n}" }
    sequence(:email) { |n| "email#{n}@example.com" }
    password "pass1234"

    factory :admin do
      first_name "Sally"
      last_name  "Admin"
      role "admin"
    end

    factory :support do
      first_name "Frank"
      last_name  "Support"
      role "support"
    end

  end

end