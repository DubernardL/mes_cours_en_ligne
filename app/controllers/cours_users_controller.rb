class CoursUsersController < ApplicationController
  def index
    cours = current_user.cours
    @hit_cours = cours.where(category: "Histoire").sort_by { |cours| cours.name }.reverse
    @geo_cours = cours.where(category: "Géographie").sort_by { |cours| cours.name }.reverse
    @emc_cours = cours.where(category: "EMC").sort_by { |cours| cours.name }.reverse
    authorize(:cour_user)
  end

  def new
    @users = User.where(status: 'Elève')
    @cours_user = CoursUser.new
    authorize(:cour_user)
  end
end
