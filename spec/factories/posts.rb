FactoryGirl.define do
  factory :post, class: Post do
    title  "Blog Post Title Here"
    body   "A simple blog post"
    status "published"
    category "Ruby"

    factory :blog do
      title "The Booming field of Programming"
      body  "Web development, and programming in general, is a booming field.
             However not enough college bound young adults are choosing to
             persue this awesome field of study."
      category "Programming"
    end

    factory :ssh do
      title "Passwordless login with ssh"
      body   "To be able to login to your remote over ssh, without using
              a password, you will need to have created your private and public
              ssh key pair.  Commonly found as id_dsa and id_dsa.pub."
      category "DevOPs"
    end

    factory :draft do
      title "Why are women paid less then men?"
      body   "A frequent topic that surfaces in our community, is the claim that
              women are paid less than men for the same job."
      status "draft"
      category "Social"
    end

    factory :retired do
      title  "How To Install Rails 2.0"
      body   "Today we are going to review how to install Rails 2.0 with our Ruby 1.87 install."
      status "retired"
    end

  end
end
