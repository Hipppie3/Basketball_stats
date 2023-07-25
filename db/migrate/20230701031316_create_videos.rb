class CreateVideos < ActiveRecord::Migration[7.0]
  def change
    create_table :videos do |t|
      t.string :url
      t.string :title
      t.references :player, null: true, foreign_key: true

      t.timestamps
    end
  end
end
