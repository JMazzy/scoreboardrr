class Match < ApplicationRecord
  validates :game_id, presence: true

  belongs_to :game
  has_many :team_matches, dependent: :destroy
  has_many :teams, through: :team_matches
end
