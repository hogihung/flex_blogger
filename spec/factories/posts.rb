FactoryGirl.define do
  factory :post do
    title  "Blog Post Title Here"
    body   "A simple blog post"
    status "published"
    category "Ruby"

    factory :blog do
      title "The Booming field of Programming"
      body  "Web development, and programming in general, is a booming field.
             However not enough college bound young adults are choosing to
             persue this awesome field of study."
      status "published"
      category "Programming"
    end

    factory :ssh do
      title "Passwordless login with ssh"
      body   "To be able to login to your remote over ssh, without using
              a password, you will need to have created your private and public
              ssh key pair.  Commonly found as id_dsa and id_dsa.pub."
      status "published"
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
      category "Ruby"
    end

    factory :not_ruby do
      title "Aint Your Ruby"
      body  "When meeting new people in the programming community, we frequently share what we do in our day jobs.  By day I primarily use Perl, though I have been slowly building up an arsenal of Ruby and Ruby on Rails applications.  But before learning Matz's Ruby, I learned a different flavor of Ruby.  And this 'aint your ruby.'"
      status "published"
      category "Ruby"
      created_at 16.days.ago
    end

    factory :deploy_error do
      title "Error Deploying to Production on Heroku"
      body  "I have been making progress with a personal application that I am working on.  In the early days of development, I had deployed a version of the application to Heroku - and it worked fine at that time.  Fast forward 6 months or so and lots of changes.  I deployed to Heroku and received an error when trying to view the website:"
      status "published"
      category "Ruby"
      created_at 14.days.ago
    end

    factory :test_suite do
      title "Learning From Test Suite Aggravation"
      body  "In my previous psot, I spoke about the Flex Blogger project.  Josh introduced us to a new component called ckeditor.  Ckeditor is a javascript based gui text editor.  After using ckeditor I thought it would be beneficial to add it to another application I created for my day job - HarePD."
      status "published"
      category "Programming"
      created_at 12.days.ago
    end

    factory :gathering do
      title "The Gathering"
      body  "A few weeks back I was discussing an idea around the weekly Code and Coffee table. The idea was a spin on something I saw Nathan Barry discussing over http://nathanbarry.com/24hours/. I still consider myself a newbie to Ruby, but I wanted to do my own personal hack-a-thon."
      status "published"
      category "Programming"
      created_at 10.days.ago
    end

    factory :postgres_remote do
      title "Enable Remote Access - Postgres"
      body  "Recently I've been troubleshooting an issue with my pet project.  On my laptop, in a development environment, I didn't seem to have any issues. My test suite has been working fine, but when I deployed the app to a production environment, I started to discover some issues.  Issues that revolve around the database. "
      status "published"
      category "DevOPs"
      created_at 8.days.ago
    end

    factory :ssh_access do
      title "Custom Passwordless SSH Access"
      body  "When I created my Digital Ocean VPS I setup SSH Keys for both my main laptop and desktop computers.  I grabbed the appropriate contents from my .pub file and pasted that information on the web form for 'Add SSH Key' under the SSH Keys menu of my droplet.  However, I noticed that each time I would ssh to my server I would be required to input my password."
      status "published"
      category "DevOPs"
      created_at 6.days.ago
    end

    factory :chruby do
      title "Cha-Cha-Cha-Chruby"
      body  "Recently I got a bug, ney rather an itch I needed to scratch.  I have been using RVM for over a year and half.  I have had some issues, but mostly those were due to me learning how to work with RVM."
      status "published"
      category "Generic"
      created_at 4.days.ago
    end

    factory :tapas do
      title "Borrowing From Ruby Tapas"
      body  "I have many learning tools in my arsenal including Code School, Thoughtbot/Upcase, RailsCasts, Ruby Tapas, and too many other Internet based free resources to list.  But today I want to talk tapas, and borrow something that I learned from watching many episodes of Ruby Tapas."
      status "published"
      category "Programming"
      created_at 2.days.ago
    end

  end
end
