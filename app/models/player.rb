class Player < ApplicationRecord
  belongs_to :team
  has_many :statistics, dependent: :destroy
  has_many :videos, dependent: :destroy
  accepts_nested_attributes_for :statistics
  accepts_nested_attributes_for :videos
  has_one_attached :image
end
