class Game < ApplicationRecord
  enum score_type: [:high, :low]

  validates :name, presence: true
  validates :score_type, presence: true

  has_many :matches, dependent: :destroy
end
