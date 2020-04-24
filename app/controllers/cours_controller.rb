class CoursController < ApplicationController
  def index
    @hit_cours = Cour.where(category: "Histoire")
    @geo_cours = Cour.where(category: "Géographie")
    @emc_cours = Cour.where(category: "EMC")
  end

  def new
  end

  def create
  end

end
