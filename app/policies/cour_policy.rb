class CourPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user.status === "Admin" || user.status === "Prof"
  end

  def create?
    user.status === "Admin"
  end

  def new?
    create?
  end

  def show?
    user.status === "Admin" || user.status === "Prof" || user.cours.include?(record)
  end

  def update?
    user.status === "Admin"
  end

  def edit?
    update?
  end

  def destroy?
    user.status === "Admin"
  end

  def download?
    true
  end

  def download_aditional_file?
    true
  end
end
