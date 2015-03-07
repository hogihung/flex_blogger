FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password "theMaindud3"
    admin true
    display_name "Bobots"

    factory :contributor_one do
      email "jack@example.com"
      password "Buck3t99"
      admin false
      display_name "Jack"
    end

    factory :contributor_two do
      email "jill@example.com"
      password "ic3dWater"
      admin false
      display_name "Jill"
    end
  end
end

