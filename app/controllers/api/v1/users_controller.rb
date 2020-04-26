class Api::V1::UsersController < ActionController::Base
  def index
    @users = User.where(status: 'Elève')
    render json: @users
  end
end
