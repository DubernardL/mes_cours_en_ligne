class Api::V1::CoursUsersController < ActionController::Base
  def index
    @cours = CoursUser.all
    render json: @cours
  end

  def create
    @cours_user = CoursUser.create(cours_user_params)
    raise
    render json: @cours_user
  end

  private

  def cours_user_params
    params.require(:cours_users).permit(:user_id, :cour_id)
  end
end
