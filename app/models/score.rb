class Score < ApplicationRecord
  validates :score, numericality: true, allow_nil: true

  belongs_to :team
  belongs_to :match

  has_one :game, through: :match

  def normalized
    if (game.high?)
      normalized_high
    else
      normalized_low
    end
  end

  def opposing_teams
    match.teams.where.not(id: team.id)
  end

  def opposing_team_name
    teams = opposing_teams
    teams.count > 1 ? "Many" : teams.first.name
  end

  def <=>(other)
    sign = game.high? ? -1 : 1
    if ( !!self.score && !!other.score ) # neither is nil
      sign * (self.score <=> other.score)
    else
      1
    end
  end

  private

  def normalized_high
    max_score = match.max_score

    if (!score || !max_score || max_score == 0)
      return 0
    end

    100 * score / max_score
  end

  def normalized_low
    if (!match.max_score || !match.min_score )
      return 0
    end

    max = match.max_score
    min = match.min_score
    spread = max - min

    if ( spread == 0 )
      return 100
    end

    100 - 100 * (score - min) / spread
  end
end
