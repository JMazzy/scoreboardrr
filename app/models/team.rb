class Team < ApplicationRecord
  validates :name, presence: true

  has_many :scores, dependent: :destroy
  has_many :matches, through: :scores
  has_many :games, through: :matches

  def total_score
    scores.sum { |s| s.normalized }
  end

  def matches_played
    matches.select do |m|
      m.scores.sum { |s| s.score || 0 } > 0
    end.count
  end

  def show_medals?
    !!total_score
  end

  def <=>(other)
    -1 * ( self.total_score <=> other.total_score )
  end
end
