class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery
  
  helper_method :current_user
  before_filter :set_user_time_zone
  
  private
  
  def set_user_time_zone
    Time.zone = current_user.time_zone if current_user
  end
  
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  
  def require_user
    unless current_user
      flash[:notice] = "You must be logged in to access this page"
      redirect_to login_url
      return false
    end
  end
  
  def require_no_user
    if current_user
      flash[:notice] = "You must be logged out to access this page"
      redirect_to events_path
      return false
    end
  end

end
