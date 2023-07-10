class Sport < ApplicationRecord
  has_many :sport_media_videos, dependent: :destroy
end
