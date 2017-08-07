class UserPolicy < ApplicationPolicy
  def index?
    @user.role == "admin" if @user
  end

  def new?
    @user.role == "admin"
  end

  def create?
    @user.role == "admin"
  end

  def edit?
    @user.role == "admin"
  end

  def update?
    @user.role == "admin"
  end

  def destroy?
    return false if @user == @record
    @user.role == "admin"
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
