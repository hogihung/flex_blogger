class HomeController < ApplicationController
  respond_to :html

	def index
    @posts = Post.text_search(params[:query])
    respond_with @posts
	end
end
