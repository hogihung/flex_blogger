FactoryGirl.define do
  factory :user do
    email "user@example.com"
    password "theMaindud3"

    factory :collab_user_one do
      email "jack@example.com"
      password "Buck3t99"
    end

    factory :collab_user_two do
      email "jill@example.com"
      password "ic3dWater"
    end
  end
end

