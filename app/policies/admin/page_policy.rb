class Admin::PagePolicy < Struct.new(:user, :page)
  def index?
    current_user.role == "admin"
  end
  
  def dashboard?
  	user.role == "admin"
  end
end