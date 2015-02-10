class UsersController < ApplicationController
  before_action :check_user
  before_action :is_admin?

  respond_to :html

	def index
    @users = User.paginate(page: params[:user], per_page: 10)
    respond_with @users
	end
end
