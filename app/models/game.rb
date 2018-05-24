class Game < ApplicationRecord
  validates :name, presence: true

  has_many :matches, dependent: :destroy
end
