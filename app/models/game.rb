class Game < ApplicationRecord
    has_many :game_players
    has_many :players, through: :game_players
  
    validates :date, presence: true
    validates :location, presence: true
  end
  