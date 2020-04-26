class Api::V1::CoursUsersController < ActionController::Base
  def index
    @cours = CoursUser.all
    render json: @cours
  end

  def create
    @cours = CoursUser.create(cours_user_params)
    render json: @cours
  end

  private

  def cours_user_params
    params.require(:cours_users).permit(:user_id, :cour_id)
  end
end
