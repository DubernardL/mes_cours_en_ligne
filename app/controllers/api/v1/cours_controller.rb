class Api::V1::CoursController < ActionController::Base
  def index
    @cours = Cour.all
    render json: @cours
  end
end
