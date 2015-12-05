class PostsController < ApplicationController
  before_action :set_post,  only: [:show,  :edit, :update, :destroy]
  before_action :check_user, except: [:show]

  respond_to :html

  def index
    @posts = Post.paginate(page: params[:page], per_page: 10)
    respond_with @posts
  end

  def new
    @post = Post.new
    respond_with(@post)
  end

  def show
    @post = Post.friendly.find(params[:id])
    set_post_redirect
  end

  def edit
  end

  def create
    @post = Post.new(create_post_params)
    flash[:notice] = "Successfully created the post." if @post.save
    respond_with @post
  end

  def update
    flash[:notice] = "Successfully updated the post." if @post.update(post_params)
    EditorPost.create(post: @post, editor: current_user)
    respond_with @post
  end

  def destroy
    flash[:notice] = "Successfully deleted the post." if @post.destroy
    redirect_to posts_path
  end

  private

  def set_post
    @post = Post.friendly.find(params[:id])
  end

  def set_post_redirect
    # If an old id or a numeric id was used to find the record, then
    # the request path will not match the post_path, and we should do
    # a 301 redirect that uses the current friendly id.
    if request.path != post_path(@post)
      redirect_to @post, status: :moved_permanently
    end
  end

  def post_params
    params.require(:post).permit(
      :body, :title, :status, :slug, :category
    )
  end

  def create_post_params
    post_params.merge(author: current_user)
  end
end
