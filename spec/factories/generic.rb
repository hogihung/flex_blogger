FactoryGirl.define do
  sequence(:email) { |n| "user#{n}@example.com" }
end
