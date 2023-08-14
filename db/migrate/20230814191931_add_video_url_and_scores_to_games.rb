class AddVideoUrlAndScoresToGames < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :video_url, :string
    add_column :games, :home_team_score, :integer
    add_column :games, :away_team_score, :integer
  end
end
