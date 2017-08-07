class ApplicationController < ActionController::Base
  include Pundit
  after_action :verify_authorized
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
  
  private
    def user_not_authorized
      flash[:warning] = "Access denied."
      redirect_to root_path if !current_user
      redirect_to (request.referrer || dashboard_path) if current_user
    end
end
