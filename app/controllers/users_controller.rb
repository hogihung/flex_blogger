class UsersController < ApplicationController
  before_action :check_user
  before_action :admin?

  respond_to :html

  def index
    @users = User.paginate(page: params[:user], per_page: 10)
    respond_with @users
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    flash[:success] = "Contributor created successfully." if @user.save
    redirect_to users_path
  end


  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
