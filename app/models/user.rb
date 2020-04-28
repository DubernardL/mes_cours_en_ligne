class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  has_many :cours_users, dependent: :destroy

  has_many :cours, through: :cours_users

  validates :username, presence: true, uniqueness: true

  @status = ["Admin", "Prof", "Elève"]
  validates :status, presence: true, inclusion: { in: @status }

  @levels = ["6ème", "5ème", "4ème", "3ème", "2nd", "1ère", "Terminale", "All"]
  validates :level, presence: true, inclusion: { in: @levels }
end
