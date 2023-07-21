class Player < ApplicationRecord
  has_many :statistics, dependent: :destroy
  has_many :videos, dependent: :destroy
  accepts_nested_attributes_for :statistics
  accepts_nested_attributes_for :videos
  has_one_attached :image
  belongs_to :sport
  belongs_to :team
end
