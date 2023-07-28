class AddGameIdToStatistics < ActiveRecord::Migration[7.0]
  def change
    add_reference :statistics, :game, null: true, foreign_key: true
  end
end
