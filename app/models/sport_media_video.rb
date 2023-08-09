class SportMediaVideo < ApplicationRecord
  belongs_to :sport
  belongs_to :games
end
