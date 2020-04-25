class CoursUser < ApplicationRecord
  belongs_to :user
  belongs_to :cour
end
