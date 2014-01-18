FactoryGirl.define do
  factory :user do
    name "Example User"
    email "user@example.com"
    password "passw0rd"
    password_confirmation "passw0rd"
  end
end