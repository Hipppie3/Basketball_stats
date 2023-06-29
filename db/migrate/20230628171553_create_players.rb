class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.string :height
      t.integer :age
      t.string :college
      t.date :birthday
      t.string :job
      t.string :country
      t.string :image

      t.timestamps
    end
  end
end
