class Match < ApplicationRecord
  validates :game_id, presence: true

  belongs_to :game
  has_many :scores, dependent: :destroy
  has_many :teams, through: :scores

  def max_score
    max = scores
      .select { |s| !!s.score }
      .map { |s| s.score }
      .max

    max ? max : 0
  end
end
