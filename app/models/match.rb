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

  def min_score
    min = scores
      .select { |s| !!s.score }
      .map { |s| s.score }
      .min

    min ? min : 0
  end

  def show_medals?
    result = false

    scores.each do |s|
      if (!s.score)
        return false # if any score is nil, no medals can be given
      elsif (s.score != 0)
        result = true # there must be at least one score that is non-zero
      end
    end

    result
  end
end
