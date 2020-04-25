class Cour < ApplicationRecord

  # Carrierwave
  mount_uploader :file, FileUploader

  @categories = ["Histoire", "Géographie", "EMC"]
  validates :category, presence: true, inclusion: { in: @categories }

  validates :name, presence: true

  validates :file, presence: true
end
