class Api::V1::CoursUsersController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def index
    @cours = CoursUser.all
    render json: @cours
  end

  def create
    cours_user = CoursUser.new(cours_user_params)
    cours_user.save
    render json: cours_user
  end

  def destroy
    cours_user = CoursUser.find(params[:id])
    cours_user.destroy
    render json: cours_user
  end

  private

  def cours_user_params
    params.permit(:user_id, :cour_id)
  end
end
