class CoursController < ApplicationController
  def index
    @hist_cours = Cour.where(category: "Histoire")
    @level_hist = []
    @hist_cours.each do |cours|
      if !@level_hist.include?(cours.level)
        @level_hist << cours.level
      end
    end
    @geo_cours = Cour.where(category: "Géographie")
    @level_geo = []
    @geo_cours.each do |cours_geo|
      if !@level_geo.include?(cours_geo.level)
        @level_geo << cours_geo.level
      end
    end
    @emc_cours = Cour.where(category: "EMC")
    @level_emc = []
    @emc_cours.each do |cours_emc|
      if !@level_emc.include?(cours_emc.level)
        @level_emc << cours_emc.level
      end
    end
    authorize(:cour)
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
    name_file = params[:file].split('/').last
    send_file(
      "#{Rails.root}/public#{params[:file]}.pdf",
      filename: "#{name_file}.pdf",
      type: "application/pdf"
    )
    authorize(:cour)
  end

  private

  def cours_params
    params.require(:cour).permit(:name, :description, :category, :level, :file, :img, {aditional_files: []})
  end
end
