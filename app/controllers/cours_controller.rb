class CoursController < ApplicationController
  def index
    @hit_cours = Cour.where(category: "Histoire")
    @geo_cours = Cour.where(category: "Géographie")
    @emc_cours = Cour.where(category: "EMC")
    authorize @hit_cours
    authorize @geo_cours
    authorize @emc_cours
  end

  def show
    @cours = Cour.find(params[:id])
    authorize @cours
  end

  def new
    @cours = Cour.new
    authorize @cours
  end

  def create
    @cours = Cour.new(cours_params)
    authorize @cours
    if @cours.save
     redirect_to cours_path
    else
      render :new
    end
  end

  def edit
    @cours = Cour.find(params[:id])
    authorize @cours
  end

  def update
    @cours = Cour.find(params[:id])
    authorize @cours
    if @cours.update(cours_params)
      redirect_to cour_path(@cours)
    else
      render :edit
    end
  end

  def destroy
    @cours = Cour.find(params[:id])
    authorize @cours
    @cours.destroy
    redirect_to cours_path
  end

  def download
    send_file(
      "#{Rails.root}/public#{params[:file]}.pdf",
      filename: "your_custom_file_name.pdf",
      type: "application/pdf"
    )
    authorize(:cour)
  end

  private

  def cours_params
    params.require(:cour).permit(:name, :description, :category, :level, :file)
  end
end
