FactoryGirl.define do
  factory :user do
    email
    password "theMaindud3"
    admin true

    factory :contributor_one do
      email "jack@example.com"
      password "Buck3t99"
      admin false
    end

    factory :contributor_two do
      email "jill@example.com"
      password "ic3dWater"
      admin false
    end
  end
end
