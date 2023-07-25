class Team < ApplicationRecord
  has_many :players
  belongs_to :sport

  validates :name, presence: true, length: { minimum: 1, maximum: 50 }
end
