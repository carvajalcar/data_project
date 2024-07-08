class Player < ApplicationRecord
  belongs_to :team
  has_many :statistics
  has_many :game_players
  has_many :games, through: :game_players

  validates :name, presence: true
  validates :position, presence: true
end

