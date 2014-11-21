class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :signed_in?

  private

  def authenticate_admin_user!
    unless current_user.try(:admin)
      flash[:error] = "You are not authorized to view this area"
      redirect_to root_path
    end
  end

  def current_user
    @current_user ||= User.where(id: session[:user_id]).first
  end

  def signed_in?
    !!current_user
  end

  def current_user=(user)
    @current_user = user
    session[:user_id] = user.try(:id)
  end

  def user_required
    unless signed_in?
      store_location
      redirect_to login_path
    end
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
end
