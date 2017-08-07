class PagePolicy < Struct.new(:user, :page)
  def index?
    true
  end
  
  def dashboard?
  	true
  end
end