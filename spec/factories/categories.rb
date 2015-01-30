FactoryGirl.define do
  factory :category do
    description "A description goes here"

    factory :programming do
      description "Programming"
    end

    factory :ruby do
      description "Ruby"
    end

    factory :javascript do
      description "JavaScript"
    end

    factory :iOS do
      description "iOS"
    end

    factory :devOPs do
      description "DevOPs"
    end

    factory :social do
      description "Social"
    end

    factory :political do
      description "Political"
    end

    factory :generic do
      description "Generic"
    end

  end
end