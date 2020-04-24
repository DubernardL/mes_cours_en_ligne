class Cour < ApplicationRecord
  @categories = ["Histoire", "Géographie", "EMC"]
  validates :category, presence: true, inclusion: { in: @categories }
end
