class CoursUsersController < ApplicationController
  def index
    cours = current_user.cours
    @hit_cours = cours.where(category: "Histoire").sort { |a, b| a <=> b }
    @geo_cours = cours.where(category: "Géographie").sort { |a, b| a <=> b }
    @emc_cours = cours.where(category: "EMC").sort { |a, b| a <=> b }
    authorize(:cour_user)
  end

  def new
    @users = User.where(status: 'Elève')
    @cours_user = CoursUser.new
    authorize(:cour_user)
  end
end
