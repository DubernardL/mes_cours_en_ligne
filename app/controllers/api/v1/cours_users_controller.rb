class Api::V1::CoursUsersController < ActionController::Base
  def index
    @cours = CoursUser.all
    render json: @cours
  end

  def new
  end

  def create
    raise
    @cours_user = CoursUser.create(cours_user_params)
    render json: @cours_user
  end

  private

  def cours_user_params
    params.require(:cours_users).permit(:user_id, :cour_id)
  end
end
