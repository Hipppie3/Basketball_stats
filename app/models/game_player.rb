# app/models/game_player.rb
class GamePlayer < ApplicationRecord
  belongs_to :game
  belongs_to :player
end