class HomeController < ApplicationController
  respond_to :html

	def index
    @posts = Post.recent
    respond_with @posts
	end
end
