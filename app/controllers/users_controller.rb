class UsersController < ApplicationController
  before_action :check_user
  before_action :admin?
  before_action :set_user, only: [:edit, :update, :destroy]

  respond_to :html

  def index
    @users = User.paginate(page: params[:user], per_page: 10)
    respond_with @users
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    flash[:success] = "Contributor created successfully." if @user.save
    redirect_to users_path
  end

  def update
    flash[:success] = "Update successfull!" if @user.update(user_params)
    redirect_to users_path
  end

  def destroy
    @user.destroy
    redirect_to users_path, alert: "Contributor removed successfully."
  end


  private

  def user_params
    params.require(:user).permit(:email, :password, :admin, :display_name)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
