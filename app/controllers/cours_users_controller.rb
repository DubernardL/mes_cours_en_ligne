class CoursUsersController < ApplicationController
  def index
  end

  def authorization
    @users = User.where(status: 'Elève')
    # @cours_level = Cour.where(level: olili.level)
    # @cours_user = CoursUser.where(user_id: olili.id)
  end

  def create(user, cours)
  end
end
