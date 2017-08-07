class Admin::PagesController < AdminController
  def dashboard
  	authorize [:admin, :page]
  end
end
