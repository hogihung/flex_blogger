unless Rails.env.production?

  require "factory_girl"

  namespace :dev do
    desc "Seed development database, maintain consistency"
    task prime: "db:setup" do
#      FactoryGirl.find_definitions unless Rails.env.test?
      include FactoryGirl::Syntax::Methods

      ## Create Users
      user = create(:user)
      contributor_one = create(:contributor_one)
      contributor_two = create(:contributor_two)

      ## Create Categories
      create(:programming)
      create(:ruby)
      create(:javascript)
      create(:iOS)
      create(:devOPs)
      create(:social)
      create(:political)
      create(:generic)

      ## Create Blog Posts

      [:blog, :ssh, :women, :retired, :draft].each do |post|
        create(post, author: user)
      end

      [:deploy_error, :test_suite, :gathering].each do |post|
        create(post, author: contributor_one)
      end

      [:postgres_remote, :ssh_access, :chruby, :tapas].each do |post|
        create(post, author: contributor_one)
      end
    end
  end
end
