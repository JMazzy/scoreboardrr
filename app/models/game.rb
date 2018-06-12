class Game < ApplicationRecord
  enum score_type: [:high, :low]

  validates :name, presence: true
  validates :score_type, presence: true

  has_many :matches, dependent: :destroy
  has_many :teams, through: :matches
  has_many :scores, through: :matches
end
