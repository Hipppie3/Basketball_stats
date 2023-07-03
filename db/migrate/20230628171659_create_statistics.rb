class CreateStatistics < ActiveRecord::Migration[7.0]
  def change
    create_table :statistics do |t|
      
      t.date :game_date
      t.string :matchup
      t.string :w_l
      t.decimal :ppg
      t.decimal :rbg
      t.decimal :apg
      t.decimal :spg
      t.decimal :bpg
      t.integer :fgm
      t.integer :fga
      t.decimal :fg_percentage
      t.integer :two_pm
      t.integer :two_pa
      t.integer :three_pm
      t.integer :three_pa
      t.integer :oreb
      t.integer :dreb
      t.integer :reb
      t.integer :ast
      t.integer :stl
      t.integer :blk
      t.integer :to
      t.integer :pts
      t.references :player, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
