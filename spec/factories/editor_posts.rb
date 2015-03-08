FactoryGirl.define do
  factory :editor_post do
    editor { create :user }
    post { create :post }
  end
end
