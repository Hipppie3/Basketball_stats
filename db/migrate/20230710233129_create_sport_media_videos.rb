class CreateSportMediaVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :sport_media_videos do |t|
      t.belongs_to :sport, foreign_key: true
      t.string :url
      t.string :title
      t.timestamps
    end
  end
end
