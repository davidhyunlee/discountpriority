class UserPolicy < ApplicationPolicy
  def index?
    @user.role == "admin" if @user
  end

  def new?
    true
  end

  def create?
    true
  end

  def edit?
    @user == @record
  end

  def update?
    @user == @record
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
