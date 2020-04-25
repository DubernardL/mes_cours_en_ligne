class CoursController < ApplicationController
  def index
    @hit_cours = Cour.where(category: "Histoire")
    @geo_cours = Cour.where(category: "Géographie")
    @emc_cours = Cour.where(category: "EMC")
  end

  def show
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
  end

  def update
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
    params.require(:cour).permit(:name, :description, :category, :file)
  end
end
