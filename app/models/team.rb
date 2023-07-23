class Team < ApplicationRecord
  has_many :games
  has_many :players
  belongs_to :sport
end
