class HomeController < ApplicationController
  respond_to :html
#  before_action :side_bar_posts

	def index
    @posts = Post.text_search(params[:query])
    respond_with @posts
	end

#def side_bar_posts
#  @sidebar_posts = Post.last_ten.drop(3)
#end
end
