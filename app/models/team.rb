class Team < ApplicationRecord
  validates :name, presence: true

  has_many :team_match, dependent: :destroy
  has_many :matches, through: :team_match
end
