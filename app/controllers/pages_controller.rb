class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :contact]

  def home
    if !user_signed_in?
      redirect_to new_user_session_path
    else
      if current_user.status === 'Elève'
        redirect_to cours_users_path
      else
        redirect_to cours_path
      end
    end
  end

  def contact
  end
end
