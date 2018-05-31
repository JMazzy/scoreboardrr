class Score < ApplicationRecord
  belongs_to :team
  belongs_to :match

  has_one :game, through: :match
end
