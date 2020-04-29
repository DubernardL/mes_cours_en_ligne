class CoursUsersController < ApplicationController
  def index
    cours = current_user.cours
    @hit_cours = cours.where(category: "Histoire")
    @geo_cours = cours.where(category: "Géographie")
    @emc_cours = cours.where(category: "EMC")
    authorize(:cour_user)
  end

  def authorization
    @users = User.where(status: 'Elève')
  end

  def create(user, cours)
  end
end
