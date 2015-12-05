class SummaryController < ApplicationController
  respond_to :html

	def index
    @posts = Post.published.paginate(page: params[:page], per_page: 10)
    respond_with @posts
	end
end
