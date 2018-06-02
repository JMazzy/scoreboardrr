class Match < ApplicationRecord
  validates :game_id, presence: true

  belongs_to :game
  has_many :scores, dependent: :destroy
  has_many :teams, through: :scores

  def max_score
    scores.map { |s| s.score }.max
  end
end
