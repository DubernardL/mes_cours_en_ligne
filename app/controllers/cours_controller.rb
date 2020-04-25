class CoursController < ApplicationController
  def index
    @cours = Cour.all
    @hit_cours = Cour.where(category: "Histoire")
    @geo_cours = Cour.where(category: "Géographie")
    @emc_cours = Cour.where(category: "EMC")
  end

  def show
    @cours = Cour.find(params[:id])
  end

  def new
    @cours = Cour.new
  end

  def create
    @cours = Cour.new(cours_params)
    if @cours.save
     redirect_to cours_path
    else
      render :new
    end
  end

  def edit
    @cours = Cour.find(params[:id])
  end

  def update
    @cours = Cour.find(params[:id])
    if @cours.update(cours_params)
      redirect_to cour_path(@cours)
    else
      render :edit
    end
  end

  def destroy
  end

  def download
    send_file(
      "#{Rails.root}/public#{params[:file]}.pdf",
      filename: "your_custom_file_name.pdf",
      type: "application/pdf"
    )
  end

  private

  def cours_params
    params.require(:cour).permit(:name, :description, :category, :level, :file)
  end
end
