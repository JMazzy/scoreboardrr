class Match < ApplicationRecord
  validates :game_id, presence: true

  belongs_to :game
  has_many :scores, dependent: :destroy
  has_many :teams, through: :scores
end
