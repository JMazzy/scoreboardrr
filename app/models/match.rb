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

  def win?(team_id)
    score = scores.find_by(team_id: team_id)
    scores.each do |s|
      if ( score && s && s.score && score.score && s.id != score.id && s > score )
        return false
      end
    end

    true
  end
end
