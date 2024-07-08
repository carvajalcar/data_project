class Statistic < ApplicationRecord
  belongs_to :player

  validates :points, :rebounds, :assists, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end

