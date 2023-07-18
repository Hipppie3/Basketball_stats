class Game < ApplicationRecord
  has_many :teams
  has_many :players, through: :teams
  has_many :statistics
end
