class AddSportIdToTeams < ActiveRecord::Migration[7.0]
  def change
    add_reference :teams, :sport, foreign_key: true, null: true
  end
end
