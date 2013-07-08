FactoryGirl.define do
  factory :user do
    name "username"
    email "sample@example.com"
    password "hunter2"
    password_confirmation "hunter2"

    factory :admin_user do
      admin true
    end
  end
end
