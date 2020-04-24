class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true
  @status = ["Admin", "Prof", "Elève"]
  validates :status, presence: true, inclusion: { in: @status }
end
