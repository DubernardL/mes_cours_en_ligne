class CourUserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user.status === 'Elève'
  end

  def new?
    user.status === 'Admin'
  end
end
