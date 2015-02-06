unless Rails.env.production?

  require "factory_girl"

  namespace :dev do
    desc "Seed development database, maintain consistency"
    task prime: "db:setup" do
      include FactoryGirl::Syntax::Methods

      ## Create Users
      create(:user)
      create(:collab_user_one)
      create(:collab_user_two)

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
    end
  end
end
