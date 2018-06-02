class Score < ApplicationRecord
  belongs_to :team
  belongs_to :match

  has_one :game, through: :match

  def normalized(max_score)
    100 * score / max_score
  end
end
