class AdminController < ApplicationController
  layout 'admin/application'

  #raise Pundit::NotAuthorizedError, "You are not authorized." unless current_user.role == :admin

  private
  # def authorized?
  #   unless current_user.role == :admin
  #     flash[:error] = "You are not authorized to view that page."
  #     redirect_to root_path
  #   end
  # end
end
