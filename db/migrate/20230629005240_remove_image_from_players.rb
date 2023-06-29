class RemoveImageFromPlayers < ActiveRecord::Migration[7.0]
  def change
    remove_column :players, :image, :string
  end
end
