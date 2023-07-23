class Sport < ApplicationRecord
  has_many :sport_media_videos, dependent: :destroy
  has_many :players, through: :teams
  has_many :teams
end
