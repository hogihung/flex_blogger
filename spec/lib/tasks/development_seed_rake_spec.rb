require "rails_helper"
require "rake"

describe "dev namespace rake task", type: :rake do

  describe "dev:prime" do

    before :all do
      Rake.application.rake_require "tasks/development_seed"
      Rake::Task.define_task(:environment)
      Rake::Task.define_task("db:setup")
    end

    let :run_rake_task do
      Rake::Task["dev:prime"].reenable
      Rake.application.invoke_task "dev:prime"
    end

    it "should create three Users" do
      run_rake_task
      expect(User.count).to eq 3
    end

    it "should create eight Categories" do
      run_rake_task
      expect(Category.count).to eq 8
    end

    it "should create four Blog Posts" do
      run_rake_task
      expect(Post.count).to eq 4
    end

  end
end