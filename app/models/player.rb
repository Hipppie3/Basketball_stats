class Player < ApplicationRecord
  has_many :statistics, dependent: :destroy
  has_many :videos, dependent: :destroy
  accepts_nested_attributes_for :statistics
  accepts_nested_attributes_for :videos
  has_one_attached :image
  belongs_to :sport, optional: true
  belongs_to :team, optional: true
  has_many :game_players
  has_many :games, through: :game_players
end
 