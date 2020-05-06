class Api::V1::CoursUsersController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def index
    @cours = CoursUser.all
    render json: @cours
  end

  def create
    cours_user = CoursUser.new(cours_user_params)
    if cours_user.save
      render json: {status: 'SUCCESS', message: 'CoursUser saved', data: cours_user, status: :ok}
    else
      render json: {status: 'ERROR', message: 'CoursUser not saved', data: cours_user.errors, status: :unprocessable_entity}
    end
  end

  private

  def cours_user_params
    params.permit(:user_id, :cour_id)
  end
end
