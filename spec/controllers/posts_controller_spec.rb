require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  describe "GET #show" do

    before :each do
      @post = FactoryGirl.create(:post)
      @old_slug = @post.slug 
      @post.update(title: 'Darkhorse post')
      @new_slug = @post.slug
    end

    it "redirects old slug to new slug" do
      get :show, id: @old_slug
      new_location = post_path(@new_slug)
      expect(response).to redirect_to(new_location)
    end
  end
end