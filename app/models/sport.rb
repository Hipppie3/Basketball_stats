class Sport < ApplicationRecord
  has_many :sport_media_videos, dependent: :destroy
  has_many :players
  has_many :teams
end
