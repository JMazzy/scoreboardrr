class Match < ApplicationRecord
  validates :game_id, presence: true

  belongs_to :game
  has_many :team_matches, dependent: :destroy
  has_many :teams, through: :team_matches

  def score
    scores = {}
    teams.each do |t|
      team_score = team_matches.find_by(team_id: t.id).score
      break unless team_score

      scores[t.name] = team_score
    end
    scores
  end

  def score_string
    score_val = score
    return "Not Played" if score_val.keys.empty?

    score_strings = score.map do |k, v|
      "#{k} #{v}"
    end

    score_strings.join(' - ')
  end
end
