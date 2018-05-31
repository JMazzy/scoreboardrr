class Team < ApplicationRecord
  validates :name, presence: true

  has_many :scores, dependent: :destroy
  has_many :matches, through: :scores
end
