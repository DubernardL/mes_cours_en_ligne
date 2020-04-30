class CoursUsersController < ApplicationController
  def index
    cours = current_user.cours
    @hit_cours = cours.where(category: "Histoire")
    @geo_cours = cours.where(category: "Géographie")
    @emc_cours = cours.where(category: "EMC")
    authorize(:cour_user)
  end

  def new
    @users = User.where(status: 'Elève')
    authorize(:cour_user)
  end
end
