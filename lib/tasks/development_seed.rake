unless Rails.env.production?

  require "factory_girl"

  namespace :dev do
    desc "Seed development database, maintain consistency"
    task prime: "db:setup" do
#      FactoryGirl.find_definitions unless Rails.env.test?
      include FactoryGirl::Syntax::Methods

      ## Create Users
      create(:user)
      create(:contributor_one)
      create(:contributor_two)

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
      create(:blog)
      create(:ssh)
      create(:draft)
      create(:retired)
      create(:not_ruby)
      create(:deploy_error)
      create(:test_suite)
      create(:gathering)
      create(:postgres_remote)
      create(:ssh_access)
      create(:chruby)
      create(:tapas)
    end
  end
end
