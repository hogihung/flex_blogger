class ApplicationController < ActionController::Base
  include Clearance::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

#  def authorize
#    redirect_to root_path, alert "Not Authorized" if current_user.nil?
#  end
end
