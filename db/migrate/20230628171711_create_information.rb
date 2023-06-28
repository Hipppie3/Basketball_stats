class CreateInformation < ActiveRecord::Migration[7.0]
  def change
    create_table :information do |t|
      t.string :team
      t.string :position
      t.integer :number
      t.references :player, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
