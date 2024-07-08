class Team < ApplicationRecord
    has_many :players
    has_one :classification
  
    validates :name, presence: true, uniqueness: true
    validates :city, presence: true
  end
  