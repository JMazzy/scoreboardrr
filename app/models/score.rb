class Score < ApplicationRecord
  validates :score, numericality: true, allow_nil: true

  belongs_to :team
  belongs_to :match

  has_one :game, through: :match

  def normalized(max_score=nil)
    if (!max_score)
      max_score = match.max_score
    end

    if (!score || !max_score || max_score == 0)
      return 0
    end

    100 * score / max_score
  end

  def opposing_teams
    match.teams.where.not(id: team.id)
  end

  def opposing_team_name
    teams = opposing_teams
    teams.count > 1 ? "Many" : teams.first.name
  end

  def <=>(other)
    if ( !!self.score && !!other.score ) # neither is nil
      other.score - self.score
    else
      1
    end
  end
end
