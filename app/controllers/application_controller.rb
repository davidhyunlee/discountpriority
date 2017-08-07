class ApplicationController < ActionController::Base
  include Pundit
  after_action :verify_authorized
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery with: :exception

  def current_user
  	begin
    	@current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue => e
    	session[:user_id] = nil
    	flash[:warning] = "Unable to restore session as the account doesn't exist."
	end
  end

  helper_method :current_user
  
  private
    def user_not_authorized
      flash[:warning] = "Access denied."
      redirect_to root_path if !current_user
      redirect_to (request.referrer || dashboard_path) if current_user
    end
end
