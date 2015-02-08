FactoryGirl.define do
  factory :user do
    email "user@example.com"
    password "theMaindud3"
    admin true

    factory :collab_user_one do
      email "jack@example.com"
      password "Buck3t99"
      admin false
    end

    factory :collab_user_two do
      email "jill@example.com"
      password "ic3dWater"
      admin false
    end
  end
end

