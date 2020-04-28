class CoursUsersController < ApplicationController
  def index
    cours = current_user.cours
    @hit_cours = cours.where(category: "Histoire")
    @geo_cours = cours.where(category: "Géographie")
    @emc_cours = cours.where(category: "EMC")
  end

  def authorization
    @users = User.where(status: 'Elève')
    # @cours_level = Cour.where(level: olili.level)
    # @cours_user = CoursUser.where(user_id: olili.id)
  end

  def create(user, cours)
  end
end
