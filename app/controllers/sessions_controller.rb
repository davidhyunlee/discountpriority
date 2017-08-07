class SessionsController < ApplicationController
  layout false, only: :new
  # skip_before_action :require_login, only: [:new, :create]

  def new
  	redirect_to dashboard_path if current_user
  	authorize :session, :new?
  end

  def create
    user = User.find_by_email(params[:email])
    authorize :session, :create?

    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to '/dashboard'
    else
    # If user's login doesn't work, send them back to the login form.
      flash[:warning] = "Authentication has failed."
      redirect_to '/login'
    end
  end

  def destroy
  	authorize :session, :destroy?
    session[:user_id] = nil
    flash[:success] = "You have been successfully logged out of your session."
    redirect_to root_path
  end
end