FactoryGirl.define do
  sequence(:email) {|n| "test#{n}@taskmanage.com" }
  
  factory :user do
    name "test"
    email 
    password "password"
    password_confimation "password"
  end
end
