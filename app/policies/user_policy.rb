class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user.status === "Admin"
  end

  def create?
    user.status === "Admin"
  end

  def new?
    create?
  end

  def destroy?
    user.status === "Admin"
  end
end
