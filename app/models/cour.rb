class Cour < ApplicationRecord

  has_many :cours_users, dependent: :destroy
  has_many :users, through: :cours_users

  # Carrierwave
  mount_uploader :file, FileUploader

  @categories = ["Histoire", "Géographie", "EMC"]
  validates :category, presence: true, inclusion: { in: @categories }

  @levels = ["6ème", "5ème", "4ème", "3ème", "2nd", "1ère", "Terminale", "All"]
  validates :level, presence: true, inclusion: { in: @levels }

  validates :name, presence: true

  validates :file, presence: true
end
