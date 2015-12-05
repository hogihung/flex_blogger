class HomeController < ApplicationController
  respond_to :html

	def index
    @posts = Post.text_search(params[:query])
    respond_with @posts
	end

  def feed
    @posts_rss = Post.published
    respond_to do |format|
      format.rss { render :layout => false}
    end
  end

end
